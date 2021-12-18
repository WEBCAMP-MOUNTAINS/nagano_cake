class CreateAdminsJeneres < ActiveRecord::Migration[5.2]
  def change
    create_table :admins_jeneres do |t|
      t.string :name

      t.timestamps
    end
  end
end
