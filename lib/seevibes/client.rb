require "sinatra/base"
require "redis"

module Seevibes
  class Client < Sinatra::Base

    # before do
    #   @redis = Redis.new(ENV["REDIS_URL"] || raise("Missing REDIS_URL environment variable - can't continue"))
    # end

    attr_reader :redis

    get "/hello" do
      "Well! Hello there, #{params[:name]}"
    end

  end
end
