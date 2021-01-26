class IssueWorker
  def self.call
    puts "testing"
    res_json = Issue.from_github
    Issue.to_slack(res_json)
  end
end
