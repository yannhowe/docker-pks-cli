FROM ubuntu:latest

RUN  \
    apt-get update && \
    apt install gnupg wget -y && \
    wget -q -O - https://raw.githubusercontent.com/starkandwayne/homebrew-cf/master/public.key | apt-key add - && \
    echo "deb http://apt.starkandwayne.com stable main" | tee /etc/apt/sources.list.d/starkandwayne.list && \
    apt-get update && \
    apt install pks

ENTRYPOINT ["/bin/sh"]