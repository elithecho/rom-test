# frozen_string_literal: true

require "rubygems"
require "bundler"

ENV["RACK_ENV"] ||= "development"
ENV["APP_ENV"] = ENV["RACK_ENV"]

env = ENV["APP_ENV"]

Bundler.require(:default, env)

if %w[development test].include?(env)
  require "dotenv"

  Dotenv.load(".env", ".env.#{env}")
end
