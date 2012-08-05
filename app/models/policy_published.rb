class PolicyPublished < ActiveRecord::Base
  attr_accessible :adkim, :aspf, :domain, :p, :pct, :report_id

  belongs_to :report
end
