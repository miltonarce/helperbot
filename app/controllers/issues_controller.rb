require 'net/http'

class IssuesController < ApplicationController

  def index
    url = URI.parse('https://api.github.com/repos/miltonarce/helperbot/issues') 
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.get(url.request_uri)
    render :json => res.body
    
    # @issues = Issue.all
    # render json: @issues
  end
end
