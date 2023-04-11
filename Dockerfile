FROM openscad/openscad

ENV OPENSCADPATH="/openscad/.local/share/OpenSCAD/libraries"
RUN mkdir -p $OPENSCADPATH

RUN apt update && apt install -y wget

RUN rm -rf /tmp/BOSL2.tar.gz $OPENSCADPATH/BOSL2-master $OPENSCADPATH/BOSL2
RUN wget -O /tmp/BOSL2.tar.gz https://github.com/revarbat/BOSL2/archive/refs/heads/master.tar.gz 2>/dev/null
RUN tar -xvf /tmp/BOSL2.tar.gz -C $OPENSCADPATH 2>/dev/null
RUN mv $OPENSCADPATH/BOSL2-master $OPENSCADPATH/BOSL2
