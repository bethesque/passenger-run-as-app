FROM phusion/passenger-ruby24:1.0.0

RUN bash -lc 'rvm --default use ruby-2.4.5'

ENV APP_HOME=/home/app/the_app/
RUN rm -f /etc/service/nginx/down /etc/nginx/sites-enabled/default
COPY container /
# USER app

COPY --chown=app the_app/ $APP_HOME/
RUN cd $APP_HOME && \
    gem install --no-document --minimal-deps bundler && \
    bundle install --deployment --without='development test' && \
    rm -rf vendor/bundle/ruby/2.4.0/cache/ /usr/local/rvm/rubies/ruby-2.4.4/lib/ruby/gems/2.4.0/cache

EXPOSE 80
CMD ["/sbin/my_init"]
