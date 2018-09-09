class ChangeColumnOnSnacksFromTypeToBrand < ActiveRecord::Migration[5.1]
  def change
    rename_column :snacks, :type, :brand
  end
end
