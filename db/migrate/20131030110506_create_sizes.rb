class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
	  	t.string :name
	  	t.belongs_to :category
    	t.timestamps
    end
  end
end
