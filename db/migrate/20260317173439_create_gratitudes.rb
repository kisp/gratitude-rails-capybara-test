class CreateGratitudes < ActiveRecord::Migration[7.1]
  def change
    create_table :gratitudes do |t|
      t.text :content
      t.date :entry_date

      t.timestamps
    end
  end
end
