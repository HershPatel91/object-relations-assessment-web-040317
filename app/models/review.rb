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

