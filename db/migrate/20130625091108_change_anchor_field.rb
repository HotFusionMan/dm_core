class ChangeAnchorField < ActiveRecord::Migration
  def up
    change_column  :core_payment_histories, :anchor_id, :string, :limit => 20
  end

  def down
    change_column  :core_payment_histories, :anchor_id, :integer
  end
end
