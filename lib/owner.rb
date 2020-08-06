require 'pry'
class Owner
  # code goes here
  attr_reader :species, :name
  @@all = []

  def initialize(name, species = 'human')
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.filter do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.filter do |dog|
      dog.owner == self
    end
  end

  def buy_cat (cat_name)
    #binding.pry
    cat_to_buy = Cat.new(cat_name, self)
  end
  
  def buy_dog (dog_name)
    dog_to_buy = Dog.new(dog_name, self)
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end
end