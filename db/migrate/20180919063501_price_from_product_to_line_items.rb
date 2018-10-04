class PriceFromProductToLineItems < ActiveRecord::Migration[5.1]
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |line_item|
      line_item.price = Product.find(line_item.product_id).price
    end
  end

  def down
    remove_column :line_item, :price, :decimal
  end
end
