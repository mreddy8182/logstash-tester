FROM logstash:2.3

RUN plugin install --development

ARG FILTER_CONFIG
ARG PATTERN_CONFIG
ARG FILTER_TESTS
ARG PATTERN_TESTS

ADD $PATTERN_CONFIG /etc/logstash/patterns
ADD test /test
ADD $FILTER_CONFIG /test/spec/filter_config
ADD $FILTER_TESTS /test/spec/filter_data
ADD $PATTERN_TESTS /test/spec/pattern_data

ENTRYPOINT ["/test/run-tests.sh"]
# ENTRYPOINT ["bash"]
