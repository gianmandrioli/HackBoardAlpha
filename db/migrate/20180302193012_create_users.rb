class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :title
      t.string :mobile, validates: :mobile, format: { with: /\d{4}-\d{3}-\d{4}/, message: "Formato numero invalido" }
      t.string :password

      t.timestamps
    end
  end
end
