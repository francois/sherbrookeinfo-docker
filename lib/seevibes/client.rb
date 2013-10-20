require "sinatra/base"
require "redis"

module Seevibes
  class Client < Sinatra::Base

    get "/hello" do
      "Well! Hello there, #{params[:name]}"
    end

    before do
      @redis = Redis.new(url: ENV["REDIS_URL"] || raise("Missing REDIS_URL environment variable - can't continue"))
    end

    attr_reader :redis

    get "/remember" do
      count = redis.incr params[:name]
      count.times.map do |index|
        "#{params[:name]} was seen #{index + 1}!"
      end.join("<br>")
    end

  end
end
