FROM busybox
ARG FOO="Hello"
ARG BAR="World"
ENV FOO=${FOO}
ENV BAR=${BAR}
ENV MESSAGE="${FOO} ${BAR}!"
CMD ["sh", "-c", "echo $MESSAGE"]
