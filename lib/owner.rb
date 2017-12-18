require "pry"

class Owner
  attr_reader :species
  attr_accessor :name
  attr_accessor :pets


    @@all = []

  def self.all
    @@all << self
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def initialize(species)
    @species = species
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets[:dogs].each do |dog|
      dog.mood = "nervous"
    end
    self.pets[:cats].each do |cat|
      cat.mood = "nervous"
    end
    self.pets[:fishes].each do |fish|
      fish.mood = "nervous"
    end
    self.pets.clear
  end

  def list_pets
    total_dogs = self.pets[:dogs].length
    total_cats = self.pets[:cats].length
    total_fish = self.pets[:fishes].length
    return "I have #{total_fish} fish, #{total_dogs} dog(s), and #{total_cats} cat(s)."
  end

end
