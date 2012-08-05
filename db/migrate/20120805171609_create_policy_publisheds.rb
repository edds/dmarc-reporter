class CreatePolicyPublisheds < ActiveRecord::Migration
  def change
    create_table :policy_publisheds do |t|
      t.integer :report_id
      t.string :domain
      t.string :adkim
      t.string :aspf
      t.string :p
      t.string :pct

      t.timestamps
    end
  end
end
