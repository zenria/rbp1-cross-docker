FROM rustembedded/cross:arm-unknown-linux-gnueabihf

RUN apt-get install -y curl && \
    curl -sL https://github.com/raspberrypi/tools/archive/5caa7046982f0539cf5380f94da04b31129ed521.tar.gz  | tar xzf - -C /usr/local --strip-components=1


RUN rm -rf /usr/arm-linux-gnu* 

RUN mv /usr/local/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf /usr/arm-linux-gnueabihf

RUN rm -rf /usr/local/arm-bcm2708

RUN curl -sL ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.9.tar.bz2 | tar jxf - &&\
    cd alsa-lib-1.1.9 &&\
    AR=arm-linux-gnueabihf-ar CC=arm-linux-gnueabihf-gcc ./configure --host=arm-linux-gnueabihf &&\
    make -j4 &&\
    make install
