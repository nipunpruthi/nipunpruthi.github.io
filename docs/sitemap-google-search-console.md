# Sitemap – Google Search Console

## "Sitemap couldn't be read" (fetchable but unreadable)

The site serves a **sitemap index** at `sitemap.xml` (and `sitemaps.xml`) that points to a child sitemap `sitemap-pages.xml`. Some parsers accept the index when they reject a direct urlset.

- **sitemap.xml** → `<sitemapindex>` with one entry: `sitemap-pages.xml`
- **sitemap-pages.xml** → `<urlset>` (all indexable pages; schema-person/schema-website excluded)
- **No `standalone="yes"`**; **XML declaration at byte 0** (no leading newline/BOM); **`lastmod` in RFC 3339**.

Templates: `layouts/index.sitemapindex.xml`, `layouts/sitemap.xml`, `layouts/sitemaps.xml`, `layouts/index.sitemappages.xml`. After deploying, in Search Console remove the sitemap and re-add `sitemap.xml`, then wait 24–48 hours.

---

## "Couldn't fetch" (URL not reachable)

The live sitemap at **https://nipunpruthi.github.io/sitemap.xml** returns **HTTP 200** and **Content-Type: application/xml**. If Google Search Console still shows "Couldn't fetch", try the following.

## 1. Use the right property

- In [Google Search Console](https://search.google.com/search-console), open a property whose URL is **exactly**:
  - **https://nipunpruthi.github.io** (URL prefix; no trailing path, no `www`).
- Do **not** use a Domain property (e.g. `nipunpruthi.github.io`) for submitting this sitemap unless you’ve set it up for that domain.
- If you don’t have this property, add it: **Add property** → **URL prefix** → `https://nipunpruthi.github.io`.

## 2. Add the sitemap in that property

- In the left menu: **Sitemaps**.
- Under "Add a new sitemap", enter **one** of:
  - `sitemap.xml`
  - `https://nipunpruthi.github.io/sitemap.xml`
- Click **Submit**.

## 3. Use URL Inspection to test the sitemap

- In the left menu: **URL Inspection**.
- Enter: `https://nipunpruthi.github.io/sitemap.xml`.
- Click **Test live URL** (or **View tested page**).
- Check the result:
  - If it says the URL is on Google or "URL is available to Google", the sitemap is fetchable; the "Couldn't fetch" in Sitemaps may be temporary.
  - If it shows an error (e.g. redirect, 404, or fetch failed), that explains the problem.

## 4. Request indexing for the sitemap (optional)

- After testing the sitemap URL in URL Inspection, if the test succeeds, click **Request indexing**.
- Then in **Sitemaps**, remove the sitemap entry and add it again (e.g. `sitemap.xml`) and submit.
- Wait 24–48 hours and check the Sitemaps report again.

## 5. Ping Google (optional)

Open this URL in your browser (or run with `curl`) so Google knows the sitemap exists:

```
https://www.google.com/ping?sitemap=https://nipunpruthi.github.io/sitemap.xml
```

## 6. Confirm discovery

The sitemap is already:

- Declared in **robots.txt**: `Sitemap: https://nipunpruthi.github.io/sitemap.xml`
- Linked in the site **head**: `<link rel="sitemap" type="application/xml" href="...">`

So Google can discover it by crawling the site and by reading robots.txt. No code change is required for discovery.

## If it still fails

- "Couldn't fetch" is often **temporary**. Retry after 24–48 hours.
- Ensure you’re not blocking Googlebot (e.g. in **robots.txt** or **Settings → Crawling**). Your robots.txt has `Allow: /` and is correct.
- If you use a **Domain** property, try adding a **URL prefix** property `https://nipunpruthi.github.io` and submit the sitemap there; Google sometimes fetches sitemaps only for the URL prefix property.
