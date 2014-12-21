class Record < ActiveRecord::Base
  belongs_to :report

  after_save :update_report_counts

  def self.save_dmarc(dmarc)
    report = Report.create(dmarc.metadata)
    report.create_policy_published(dmarc.policy_published)
    dmarc.records.each do |row|
      report.records << Record.create(row)
    end
  end

  def update_report_counts
    report.update_counts if report
  end
end
