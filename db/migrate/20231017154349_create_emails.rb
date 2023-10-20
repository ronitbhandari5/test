class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :from
      t.string :to
      t.text :body

      t.timestamps
    end
  end
end
