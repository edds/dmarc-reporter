class Record < ActiveRecord::Base
  attr_accessible :comment, :count, :disposition, :dkim, :dkim, :dkim_domain, :dkim_hresult, :dkim_result, :header_from, :report_id, :source_ip, :spf, :spf_domain, :spf_result, :reson_type

  belongs_to :report

  after_save :update_report_counts

  def update_report_counts
    self.report.update_counts
  end
end
