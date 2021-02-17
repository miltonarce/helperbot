class Issue < ApplicationRecord
  def self.from_github
    url = URI.parse('https://api.github.com/repos/miltonarce/helperbot/issues') 
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.get(url.request_uri)
    
    res_json = JSON.parse(res.body)
  end

  def self.to_slack(res_json)
    # Token
    token = ENV['SLACK_KEY']
    
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
    
  end
end
