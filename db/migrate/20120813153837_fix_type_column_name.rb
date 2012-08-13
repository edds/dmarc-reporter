class FixTypeColumnName < ActiveRecord::Migration
  def up
    rename_column :records, :type, :reason_type
  end

  def down
    rename_column :records, :reason_type, :type
  end
end
