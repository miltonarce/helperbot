require 'net/http'
require 'json'

class IssuesController < ApplicationController

  def index
    url = URI.parse('https://api.github.com/repos/miltonarce/helperbot/issues') 
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.get(url.request_uri)
    render :json => res.body
 
    res_json = JSON.parse(res.body)
   
    # Token
    token = "Bearer xoxb-1606047993505-1586911897958-csHC0mEH9y3gSPJsLrXFXOgz"
     message = ""
     
    res_json.each {|n| 
      text = "*#{n["title"]}*\n #{n["body"]} \n #{n["html_url"]} `To respond click on the link!` \n \n"
      message += text
    }


    data = {channel: 'C01HU1E1AGZ', text: message, username: "HelperBot"}
    urlToPost = URI.parse('https://slack.com/api/chat.postMessage')
    httpToPost = Net::HTTP.new(urlToPost.host, urlToPost.port)
    httpToPost.use_ssl = true
    httpToPost.post(urlToPost, data.to_json, {"Content-Type" => "application/json", "Accept" => "application/json", "Authorization" => token,})
    

    
    # @issues = Issue.all
    # render json: @issues
  end
end
