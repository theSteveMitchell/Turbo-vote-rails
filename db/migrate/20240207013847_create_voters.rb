class CreateVoters < ActiveRecord::Migration[7.1]
  def change
    create_table :voters do |t|
      t.string :email
      t.string :postal_code

      t.timestamps
    end
  end
end
