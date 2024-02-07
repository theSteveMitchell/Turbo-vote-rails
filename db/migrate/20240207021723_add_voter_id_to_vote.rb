class AddVoterIdToVote < ActiveRecord::Migration[7.1]
  def change
    change_table :votes do |t|
      t.references :voter, null: false, foreign_key: true
    end
  end
end
