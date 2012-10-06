class Report < ActiveRecord::Base
  attr_accessible :begin, :email, :end, :extra_contact_info, :org_name, :report_id, :failed_count, :passed_count

  has_many :records
  has_one :policy_published

  def update_counts
    counts = self.records.inject({failed: 0, passed: 0}) do |sum, record|
      key = (record.disposition == 'reject') ? :failed : :passed
      sum[key] = sum[key] + record.count
      sum
    end
    self.update_attributes!({failed_count: counts[:failed], passed_count: counts[:passed]})
  end
end
