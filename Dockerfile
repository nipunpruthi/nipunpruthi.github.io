FROM jekyll/jekyll:pages

WORKDIR /app

ADD . /app

CMD [ "jekyll","serve","--watch","--incremental" ]

EXPOSE 4000

