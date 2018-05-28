FROM python:2-stretch
ARG PORT
ARG KEY
ENV PORT ${PORT}
ENV KEY ${KEY}
ADD VERSION /VERSION
EXPOSE 8000-8010
#use sh to use env varible $PORT
#ENTRYPOINT ["sh","-c","python","-m","SimpleHTTPServer","$PORT"]
ENTRYPOINT python -m SimpleHTTPServer $PORT
