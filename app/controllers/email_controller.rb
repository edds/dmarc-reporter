class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    dmarc = Dmarc::Email.new(params[:message]).report
    return unless dmarc

    report = Report.create(dmarc.metadata)
    report.create_policy_published(dmarc.policy_published)
    dmarc.records.each do |row|
      report.records << Record.create(row)
    end

    render text: 'success', status: 200
  end
end
