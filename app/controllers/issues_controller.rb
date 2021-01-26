require 'net/http'
require 'json'

class IssuesController < ApplicationController

  def index
    
    res_json = Issue.from_github
    Issue.to_slack(res_json)
    
    render :json => res_json
  end
end
