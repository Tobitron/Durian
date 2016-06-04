class AddImageToCities < ActiveRecord::Migration
  def change
  	add_column :cities, :image, :string, default: 'https://s3.amazonaws.com/durianapp/default.jpg'
  end
end
