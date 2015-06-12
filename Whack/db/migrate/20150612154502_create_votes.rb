class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

    	t.integer :user_id, null: false
    	t.refereces :votable, polymorphic: true, index: true

			t.integer :value    	
      t.timestamps null: false
    end
  end
end
