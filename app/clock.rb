require './config/boot'
require './config/environment'
require 'clockwork'
require 'active_support/time'


module Clockwork
  handler do |job|
    puts "Running #{job}"
    IssueWorker.call
  end

  every(1.minutes, 'IssueWorker') 
end