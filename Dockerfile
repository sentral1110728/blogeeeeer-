FROM ruby:2.5.3

#必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           
RUN apt-get install -y vim
#作業ディレクトリの作成
RUN mkdir /blogeeeeer-

#作業ディレクトリをAPP_ROOTに割り当てる
ENV APP_ROOT /blogeeeeer-
WORKDIR $APP_ROOT

#ローカルのGemfileを追加
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#Gemfileのbundle installを実行
RUN gem install bundler
RUN bundle install
ADD . $APP_ROOT
