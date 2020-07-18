From kalilinux/kali-rolling

MAINTAINER c4mx

ENV JDCMD_VERSION="1.1.0" \
    JADX_VERSION="1.1.0"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    zsh \
    curl \
    wget \
    git \
    unzip \
    apktool \ 
    dex2jar \
    jd-gui \
    android-sdk-platform-tools

# jd-cmd
RUN wget -q -O "/tmp/jd-cmd.zip" "https://github.com/kwart/jd-cmd/releases/download/jd-cmd-${JDCMD_VERSION}.Final/jd-cli-${JDCMD_VERSION}.Final-dist.zip" \
    && unzip -qq "/tmp/jd-cmd.zip" -d "/opt/jd-cmd/" \
    && ln -s /opt/jd-cmd/jd-cli /usr/local/bin/jd-cli

# jadx
RUN cd /opt && wget -q -O "/tmp/jadx.zip" "https://github.com/skylot/jadx/releases/download/v${JADX_VERSION}/jadx-${JADX_VERSION}.zip" \
    && unzip /tmp/jadx.zip -d /opt/jadx \
    && ln -s /opt/jadx/bin/jadx /usr/local/bin/jadx

# ohmyzsh !
RUN /bin/bash -c "$(wget -q -O- 'https://gist.githubusercontent.com/c4mx/96ec49c55bd8b282cecc3bdf05bda768/raw/install_ohmyzsh.sh')"

# Vim
RUN /bin/bash -c "$(wget -q -O- 'https://gist.githubusercontent.com/c4mx/449e3799fa51ef5edadd1c05e2a495b0/raw/install_vim.sh')"

COPY decompile_apk /usr/local/bin/

RUN chmod +x /usr/local/bin/decompile_apk
