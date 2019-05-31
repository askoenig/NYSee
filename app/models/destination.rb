class Destination < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits

  def self.most_popular_destination
    hash = Hash.new{0}

    Visit.all.each {|visit| hash[visit.destination_id] += 1}

    most_popular = hash.max_by{|key, val| val}
    
    Destination.find(most_popular).name
  end   



end
