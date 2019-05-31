class Destination < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits

  def self.most_popular_destination
    hash = Hash.new{0}

    Visit.all.each {|visit| hash[visit.destination_id] += 1}

    most_popular = hash.max_by{|key, val| val}[0]

    Destination.find(most_popular).name
  end


<<<<<<< HEAD
=======

>>>>>>> 001028144a2eb913248a6f68d422e25c34ad6f3c

end
