require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "self.items_in_order should return correct number of OrderItems with passed in order_id" do
    id = 1
    other_id = 2

    assert_equal OrderItem.items_in_order(id).length, 2, "Returned the wrong number of order items"
    assert_equal OrderItem.items_in_order(other_id).length, 1, "Returned the wrong number of order items"
  end
end
