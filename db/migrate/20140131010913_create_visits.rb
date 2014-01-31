class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :abbrv8_url_id

      t.timestamps
    end
  end
end
