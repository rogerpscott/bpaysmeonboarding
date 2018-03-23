class AddBankToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :bank, foreign_key: true
  end
end
