class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.integer :user_id
      t.text :bio
      t.text :skillz
      t.text :schools
      t.text :schools
      t.text :companies
      t.text :music
      t.text :movies
      t.text :television
      t.text :magazines
      t.text :books
      t.timestamps
    end
  end
  
  def self.down
    drop_table :faqs
  end
end
