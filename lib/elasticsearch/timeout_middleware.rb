require 'timeout'
module ElasticSearch
  class TimeoutMiddleware < Faraday::Middleware

    def initialize(app, timeout = 2)
      @timeout = timeout
      super(app)
    end

    def call(env)
      Timeout.timeout(@timeout) do
        @app.call(env)
      end
    end
  end
end

Faraday.register_middleware :request, timeout: ElasticSearch::TimeoutMiddleware
