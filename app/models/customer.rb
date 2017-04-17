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
