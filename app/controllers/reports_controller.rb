class ReportsController < ApplicationController

  def index
    @reports = Report.order(:created_at).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @policy_published = @report.policy_published
    @records = @report.records.order(:count).page(params[:page])
  end

end
