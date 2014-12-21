class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :org_name
      t.string :email
      t.string :extra_contact_info
      t.string :report_id
      t.datetime :begin
      t.datetime :end

      t.timestamps null: false
    end
  end
end
