class CreateAbbrv8Url < ActiveRecord::Migration
  def change
    create_table :abbrv8_urls do |t|
      t.string :long_url
      t.string :short_url
    end
  end
end
