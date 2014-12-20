class Record < ActiveRecord::Base
  belongs_to :report

  after_save :update_report_counts

  def update_report_counts
    report.update_counts if report
  end
end
