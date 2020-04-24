FROM google/cloud-sdk:alpine AS static-googlesdk
# gcloud がどこにあるかを調べる
RUN gcloud components install gsutil

FROM anapsix/alpine-java:latest
# gsutilをこっちにコピーしてくる
RUN apk --no-cache add python3
COPY --from=static-googlesdk /google-cloud-sdk/ /google-cloud-sdk/
ENV PATH /google-cloud-sdk/bin:$PATH

# EOF 2020/04/23