class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
