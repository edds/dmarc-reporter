class AddFailedCountAndPassedCountToReport < ActiveRecord::Migration
  def up
    add_column :reports, :failed_count, :integer
    add_column :reports, :passed_count, :integer

    Report.reset_column_information
    Report.all.each do |report|
      counts = report.records.inject({failed: 0, passed: 0}) do |sum, record|
        key = (record.disposition == 'reject') ? :failed : :passed
        sum[key] = sum[key] + record.count
        sum
      end
      report.update_attributes!({failed_count: counts[:failed], passed_count: counts[:passed]})
    end
  end

  def down
    remove_column :reports, :failed_count
    remove_column :reports, :passed_count
  end
end
