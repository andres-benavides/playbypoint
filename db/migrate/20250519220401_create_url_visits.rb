class CreateUrlVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :url_visits do |t|
      t.references :url, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
