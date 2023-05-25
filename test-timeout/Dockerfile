# syntax=docker/dockerfile:1

# Note: if you are building this image slowly, see https://github.com/docker/buildx/issues/379

####################
# A base image with mirrors. We should keep this image small.
# Note: Mirrors are currently available only for x86_64 arch.
####################

FROM centos:7 AS centos-base

ARG USE_CN_MIRROR

RUN if [ "$USE_CN_MIRROR" = "1" ] ; then \
      sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#[[:space:]]*baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-*.repo; \
    fi

RUN --mount=type=cache,target=/var/cache/yum,sharing=locked \
    yum install -y epel-release centos-release-scl

RUN if [ "$USE_CN_MIRROR" = "1" ] ; then \
      sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#[[:space:]]*baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-SCLo*.repo \
      && sed -e 's!^metalink=!#metalink=!g' \
        -e 's!^#baseurl=!baseurl=!g' \
        -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
        -e 's!//download\.example/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
        -e 's!http://mirrors!https://mirrors!g' \
        -i /etc/yum.repos.d/epel*.repo; \
    fi

RUN sleep 20m

RUN --mount=type=cache,target=/var/cache/yum,sharing=locked \
    yum install -y curl wget \
    && yum update -y ca-certificates

