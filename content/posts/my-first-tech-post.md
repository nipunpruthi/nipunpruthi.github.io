---
title: "Building Scalable APIs with Go"
date: 2024-01-15T10:30:00+00:00
tags: ["Golang", "API", "Backend", "Performance"]
categories: ["technical"]
draft: false
description: "Learn how to build fast and scalable APIs using Go, featuring best practices and real-world examples."
cover:
    image: "/images/go-api-cover.jpg"
    alt: "Go API Development"
    caption: "Building robust APIs with Go"
---

# Building Scalable APIs with Go

Go has become increasingly popular for building high-performance APIs due to its excellent concurrency model, fast compilation, and robust standard library. In this post, I'll share some best practices I've learned while building production APIs with Go.

## Why Choose Go for APIs?

### Performance Benefits
- **Fast compilation**: Go compiles to native machine code
- **Low memory footprint**: Efficient garbage collection
- **Excellent concurrency**: Goroutines make handling concurrent requests efficient

### Developer Experience
- **Simple syntax**: Easy to learn and maintain
- **Rich standard library**: Built-in HTTP server, JSON handling, etc.
- **Strong typing**: Catch errors at compile time

## Setting Up a Basic API Server

Here's a simple example using Go's built-in `net/http` package:

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
)

type Response struct {
    Message string `json:"message"`
    Status  int    `json:"status"`
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
    response := Response{
        Message: "API is healthy!",
        Status:  200,
    }
    
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(response)
}

func main() {
    http.HandleFunc("/health", healthHandler)
    
    fmt.Println("Server starting on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

## Best Practices for Scalable APIs

### 1. Use a Router Framework
While the standard library is great, frameworks like Gin or Echo provide additional features:

```go
package main

import (
    "github.com/gin-gonic/gin"
    "net/http"
)

func main() {
    r := gin.Default()
    
    // Middleware
    r.Use(gin.Logger())
    r.Use(gin.Recovery())
    
    // Routes
    api := r.Group("/api/v1")
    {
        api.GET("/health", func(c *gin.Context) {
            c.JSON(http.StatusOK, gin.H{
                "message": "API is healthy!",
                "status":  200,
            })
        })
    }
    
    r.Run(":8080")
}
```

### 2. Implement Proper Error Handling

```go
type APIError struct {
    Code    int    `json:"code"`
    Message string `json:"message"`
}

func (e APIError) Error() string {
    return e.Message
}

func errorHandler(c *gin.Context, err error) {
    var apiErr APIError
    
    switch e := err.(type) {
    case APIError:
        apiErr = e
    default:
        apiErr = APIError{
            Code:    500,
            Message: "Internal server error",
        }
    }
    
    c.JSON(apiErr.Code, apiErr)
}
```

### 3. Use Context for Request Lifecycle

```go
func getUserHandler(c *gin.Context) {
    ctx := c.Request.Context()
    userID := c.Param("id")
    
    // Pass context to database calls
    user, err := userService.GetUser(ctx, userID)
    if err != nil {
        errorHandler(c, err)
        return
    }
    
    c.JSON(http.StatusOK, user)
}
```

## Performance Optimization Tips

### Connection Pooling
```go
import "database/sql"

func setupDB() *sql.DB {
    db, err := sql.Open("postgres", connectionString)
    if err != nil {
        log.Fatal(err)
    }
    
    // Configure connection pool
    db.SetMaxOpenConns(25)
    db.SetMaxIdleConns(25)
    db.SetConnMaxLifetime(5 * time.Minute)
    
    return db
}
```

### Rate Limiting
```go
import "golang.org/x/time/rate"

func rateLimitMiddleware() gin.HandlerFunc {
    limiter := rate.NewLimiter(10, 100) // 10 requests per second, burst of 100
    
    return func(c *gin.Context) {
        if !limiter.Allow() {
            c.JSON(http.StatusTooManyRequests, gin.H{
                "error": "Rate limit exceeded",
            })
            c.Abort()
            return
        }
        c.Next()
    }
}
```

## Monitoring and Observability

### Health Checks
```go
func healthCheck(db *sql.DB) gin.HandlerFunc {
    return func(c *gin.Context) {
        // Check database connection
        if err := db.Ping(); err != nil {
            c.JSON(http.StatusServiceUnavailable, gin.H{
                "status": "unhealthy",
                "database": "disconnected",
            })
            return
        }
        
        c.JSON(http.StatusOK, gin.H{
            "status": "healthy",
            "database": "connected",
        })
    }
}
```

### Metrics with Prometheus
```go
import "github.com/prometheus/client_golang/prometheus"

var (
    requestsTotal = prometheus.NewCounterVec(
        prometheus.CounterOpts{
            Name: "http_requests_total",
            Help: "Total number of HTTP requests",
        },
        []string{"method", "endpoint", "status"},
    )
)

func metricsMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Next()
        
        requestsTotal.WithLabelValues(
            c.Request.Method,
            c.FullPath(),
            fmt.Sprintf("%d", c.Writer.Status()),
        ).Inc()
    }
}
```

## Conclusion

Building scalable APIs with Go requires attention to several key areas:

1. **Choose the right tools**: Use frameworks that add value without complexity
2. **Handle errors gracefully**: Provide meaningful error messages
3. **Optimize performance**: Use connection pooling and rate limiting
4. **Monitor everything**: Implement health checks and metrics

Go's simplicity and performance make it an excellent choice for API development. The language's built-in concurrency features and growing ecosystem of libraries make it easy to build robust, scalable services.

## Next Steps

In upcoming posts, I'll dive deeper into:
- Database integration patterns
- Authentication and authorization
- Microservices architecture with Go
- Testing strategies for APIs

---

*What's your experience with Go APIs? Let me know in the comments or reach out on [Twitter](https://twitter.com/nipunpruthi)!*
