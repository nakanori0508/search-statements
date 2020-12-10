class CreateUipaths < ActiveRecord::Migration[6.0]
  def change
    create_table :uipaths do |t|
      t.string   :package_name,   null: false
      t.text     :activity_name,  null: false
      t.string   :variable_type,  null: false
      t.string   :version,        null: false
      t.text     :how_to_use,     null: false
      t.text     :description,    null: false
      t.string   :reference_url,  null: false
      t.integer  :language_id,    null: false,foreign_key: true
      t.timestamps
    end
  end
end
