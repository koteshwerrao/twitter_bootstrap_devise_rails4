class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.integer :user_id
      t.string :secretcode
      t.timestamps null: false
    end
  end
end
