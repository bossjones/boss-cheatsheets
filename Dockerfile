FROM python:3.5

RUN pip install cheat

COPY . /usr/local/lib/python3.5/site-packages/cheat/cheatsheets

CMD ["cheat", "@"]
