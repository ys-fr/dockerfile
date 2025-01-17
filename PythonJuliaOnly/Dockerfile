FROM ubuntu:20.04
# Basics
RUN apt -y update && apt install -y tzdata && apt -y upgrade

#//タイムゾーンをUTCに設定
ENV TZ UTC
RUN apt -y install ntp systemd  

RUN apt -y update && apt install -y tzdata && apt -y upgrade

# 必要なパッケージをインストール
RUN apt -y install ca-certificates git curl wget libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev
RUN apt -y install cmake gcc g++ build-essential libomp-dev llvm make libreadline-dev libbz2-dev xz-utils 
RUN apt -y install libgdbm-dev libnss3-dev pkg-config tk-dev libncursesw5-dev liblzma-dev
RUN apt -y install sqlite3 libsqlite3-dev postgresql postgresql-contrib

# Install Python
RUN wget https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz && tar zxvf Python-3.12.2.tgz
WORKDIR Python-3.12.2
RUN ./configure --prefix=/usr/local/python
#コア数に応じてjxは変更する
RUN make -s -j4
RUN make install
#Pythonのバージョンに応じてシンボリックリンクを張る
RUN ln -s /usr/local/python/bin/python3 /usr/local/bin/python && ln -s /usr/local/python/bin/pip3.12 /usr/local/bin/pip

# Install boost 
#WORKDIR /root
#RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.bz2
#RUN tar --bzip2 -xf boost_1_82_0.tar.bz2
#WORKDIR boost_1_82_0
#RUN ./bootstrap.sh
#RUN ./b2 install --prefix=/usr/local/
# symbolic link: for boost compile
#RUN ln -s /usr/local/lib/libboost_python312.a /usr/lib/x86_64-linux-gnu/libboost_python312.a && \
# ln -s /usr/local/lib/libboost_python312.so /usr/lib/x86_64-linux-gnu/libboost_python312.so && \
# ln -s /usr/local/lib/libboost_python312.so.1.82.0 /usr/lib/x86_64-linux-gnu/libboost_python312.so.1.82.0 && \
# ln -s /usr/local/lib/libboost_numpy312.a /usr/lib/x86_64-linux-gnu/libboost_numpy312.a && \
# ln -s /usr/local/lib/libboost_numpy312.so /usr/lib/x86_64-linux-gnu/libboost_numpy312.so && \
# ln -s /usr/local/lib/libboost_numpy312.so.1.82.0 /usr/lib/x86_64-linux-gnu/libboost_numpy312.so.1.82.0

# Install Python Packages

# Julia
WORKDIR /root
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.7-linux-x86_64.tar.gz
RUN tar -xvzf julia-1.6.7-linux-x86_64.tar.gz
RUN ln -s /root/julia-1.6.7/bin/julia /usr/local/bin/julia

# install packages
COPY ./PythonPackages requirements
RUN pip install -r requirements
RUN ln -s /usr/local/python/bin/jupyter /usr/local/bin/jupyter 
COPY Install.jl Install.jl
RUN julia Install.jl
