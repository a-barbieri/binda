class CreateBindaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :binda_images do |t|

      t.timestamps
    end
  end
end
