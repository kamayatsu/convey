class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings do |t|
      t.string :subject, null: false
      t.text :detail, limit: 4294967295
      t.string :organization
      t.text :response
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
