require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test "Create a merchant with all valid data" do
    merchant = Merchant.new(username: "Tiny Things", email: "tiny@things.com")
    assert merchant.valid?
  end

  test "Cannot create a merchant with no username" do
    merchant = Merchant.new(email: "mysterymerchant@gmail.com")
    assert_not merchant.valid?
  end

  test "Cannot create a merchant with no email" do
    merchant = Merchant.new(username: "So Hard To Contact")
    assert_not merchant.valid?
  end

  test "Create two merchants with different usernames" do
    Merchant.create!(username: "Whoa Smalls", email: "whoasmalls@gmail.com")
    merchant2 = Merchant.new(username: "So Small", email: "sosmall@gmail.com")
    assert merchant2.valid?
  end

  test "Cannot create a merchant with an already existing username" do
    Merchant.create!(username: "TinyRUs", email: "tinyrus@gmail.com")
    merchant2 = Merchant.new(username: "TinyRUs", email: "differentemail@gmail.com")
    assert_not merchant2.valid?
  end

  test "Create two merchants with different email addresses" do
    Merchant.create!(username: "Wee Toys", email: "weetoys@gmail.com")
    merchant2 = Merchant.new(username: "Tiny Toys", email: "tinytoys@gmail.com")
    assert merchant2.valid?
  end

  test "Cannot create two merchants with the same email addresses" do
    Merchant.create!(username: "Wee Toys", email: "store@gmail.com")
    merchant2 = Merchant.new(username: "Tiny Toys", email: "store@gmail.com")
    assert_not(merchant2.valid?)
  end
end
