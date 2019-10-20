class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings do |t|
      t.string :subject, null: false
      t.string :detail, null: false
      t.string :organization
      t.string :response
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
