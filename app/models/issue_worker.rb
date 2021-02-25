class IssueWorker
  def self.call
     res_json = Issue.from_github
     Issue.to_slack(res_json)
  end
end
