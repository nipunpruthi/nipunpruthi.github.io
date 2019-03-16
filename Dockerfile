FROM jekyll/jekyll:pages

WORKDIR /app

ADD . /app
#COPY app.js /app 
# I guess both commands are same

CMD [ "jekyll","serve","--watch"]
#,"--incremental" ]

USER 9000

EXPOSE 4000

