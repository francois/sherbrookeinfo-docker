require "sinatra/base"

module Seevibes
  class Client < Sinatra::Base

    get "/hello" do
      "Well! Hello there, #{params[:name]}"
    end

  end
end
