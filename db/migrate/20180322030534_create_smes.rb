class CreateSmes < ActiveRecord::Migration[5.1]
  def change
    create_table :smes do |t|
      t.string :bsb
      t.string :account_number
      t.string :abn
      t.string :registered_business_name
      t.string :bpay_biller_name
      t.references :bank, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :status, default: 0, index: true
      t.datetime :approved_at

      t.timestamps
    end
  end
end
