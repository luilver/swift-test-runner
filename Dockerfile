FROM swift:latest AS builder

COPY src/testrunner ./

RUN swift --version
RUN swift build --configuration release

FROM swift:latest
WORKDIR /opt/test-runner/
COPY bin/ bin/
COPY --from=builder /.build/release/TestRunner bin/

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
