FROM kenhv/mirrorbot:ubuntu

WORKDIR /usr/src/app
COPY . .

RUN set -ex \
    && chmod 777 /usr/src/app \
    && cp netrc /root/.netrc \
    && cp extract pextract /usr/local/bin \
    && chmod +x aria.sh /usr/local/bin/extract /usr/local/bin/pextract
RUN pip3 install hachoir pillow filesplit
CMD ["bash", "start.sh"]
