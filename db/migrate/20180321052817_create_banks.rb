class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :days_to_confirm
      t.boolean :require_pdf, default: false
      t.boolean :require_debit_credit_question, default: false
      t.boolean :active, default: false
      t.string :bsb_prefix

      t.timestamps
    end
  end
end
