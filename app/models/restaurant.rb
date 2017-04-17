require 'pry'

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
