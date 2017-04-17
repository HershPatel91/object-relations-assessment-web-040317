# Please copy/paste all three classes into this file to submit your solution!
require 'pry'
class Customer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	ALL
  end

  def self.find_by_name(name)
  	first = name.split(' ')[0]
  	last = name.split(' ')[1]
  	# binding.pry
  	self.all.select do |customer|
  		customer.first_name == first && customer.last_name == last
  	end.first
  end

  def self.find_all_by_first_name(name)
  	self.all.select do |customer|
  		customer.first_name = name
  	end
  end

  def self.all_names
  	self.all.collect do |customer|
  		"#{customer.first_name} #{customer.last_name}"
  	end
  end

  def add_review(restaurant, content)
  	rest = Restaurant.create_find_by(restaurant)
  	Review.new(self, rest, content)
  end
end

class Review

attr_accessor :customer, :restaurant, :content

ALL = []

def initialize(customer, restaurant, content)
	@customer = customer
	@restaurant = restaurant
	@content = content
	ALL << self
end

def self.all
	ALL
end

def customer
	self.customer
end

def restaurant
	self.restaurant
end
end

class Restaurant
  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
  	ALL
  end

  def self.find_by_name(name)
  	self.all.select do |restaurant|
  		restaurant.name == name
  	end.first
  end

  def self.create_find_by(restaurant)
  	if self.all.all? {|rest| rest.name != restaurant}
  		Restaurant.new(restaurant)
  		# binding.pry
  	else
  		arr = self.all.select {|rest| rest.name == restaurant}
  		arr[0]
  	end
  end

  def reviews
  	Review.all.select do |review|
  		review.restaurant == self
  	end
  end

  def customers
  	Review.all.collect do |review|
  		if review.restaurant == self
  			review.customer
  		end
  	end
  end
end



