class CreateAuthApplications < ActiveRecord::Migration
  def change
    create_table :auth_applications do |t|
      t.string :name, null: false
      t.uuid :uid, null: false
      t.string :secret, null: false
      t.string :redirect_uri, null: false

      t.references :owner, index: true

      t.timestamps null: false
    end

    add_index :auth_applications, [:uid, :secret]
    add_index :auth_applications, :uid
  end
end
