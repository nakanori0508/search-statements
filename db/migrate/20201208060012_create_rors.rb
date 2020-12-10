class CreateRors < ActiveRecord::Migration[6.0]
  def change
    create_table :rors do |t|
      t.string   :gem_name,       null: false
      t.text     :about_gem,      null: false
      t.text     :syntax_name,    null: false
      t.string  :version,        null: false
      t.text     :how_to_use,     null: false
      t.text     :description,    null: false
      t.string   :reference_url,  null: false
      t.integer  :language_id,    null: false,foreign_key: true
      t.timestamps
    end
  end
end
