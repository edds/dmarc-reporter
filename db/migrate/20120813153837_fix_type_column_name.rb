class FixTypeColumnName < ActiveRecord::Migration
  def up
    rename_column :record, :type, :reason_type
  end

  def down
    rename_column :record, :reason_type, :type
  end
end
