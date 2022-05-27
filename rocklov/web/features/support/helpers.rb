require "httparty"

module Helpers
  def delorean(email)
    HTTParty.get("https://rocklov-web:3000/helpers?email=#{email}")
  end
end
