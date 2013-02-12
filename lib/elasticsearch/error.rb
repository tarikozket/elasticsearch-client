module ElasticSearch
  class ConnectionFailed < StandardError; end
  class RequestError < StandardError; end
  class TimeoutError < StandardError; end
end
