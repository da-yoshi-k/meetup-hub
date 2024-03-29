class CreateEventParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :event_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :location, null: false

      t.timestamps
    end
  end
end
