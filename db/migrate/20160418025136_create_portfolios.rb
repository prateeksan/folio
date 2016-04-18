class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
