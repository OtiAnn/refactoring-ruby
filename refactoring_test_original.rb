require 'minitest/autorun'
require_relative 'ch1'

describe Customer, "#statement" do
  it "generate statement" do
    movie = Movie.new("Star War", Movie::NEW_RELEASE)
    rental = Rental.new(movie, 3)
    customer = Customer.new("John Doe")

    customer.add_rental(rental)
    customer.statement.must_equal <<-EOS.gsub(/^\s+/, '').gsub(/\n$/,'')
      Rental Record for John Doe
      Star War\t9
      Amount owed is 9
      You earned 2 frequent renter points
    EOS
  end
end

