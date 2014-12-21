class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :report_id
      t.string :source_ip
      t.string :dkim
      t.integer :count
      t.string :disposition
      t.string :dkim
      t.string :spf
      t.string :type
      t.string :comment
      t.string :header_from
      t.string :dkim_domain
      t.string :dkim_result
      t.string :dkim_hresult
      t.string :spf_domain
      t.string :spf_result

      t.timestamps null: false
    end
  end
end
