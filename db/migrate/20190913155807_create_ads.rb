class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :location
      t.text :job_description
      t.text :profile_description
      t.string :contract
      t.string :email
      t.decimal :salary
      t.string :experience
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
