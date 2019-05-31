class User < ApplicationRecord
  has_many :visits
  has_many :custom_visits
  has_many :destinations, through: :visits
  has_many :custom_destinations, through: :custom_visits
  has_many :achievements

  validates :user_name, uniqueness: true

  has_secure_password

  attr_reader :password

  def current_user
    session[:user_id] ||= nil
  end

  def full_name
    "#{self.first_name}  #{self.last_name}"
  end
  # def password=(password)
  #   @password = password
  #   salt = BCrypt::Engine::generate_salt
  #   hashed = BCrypt::Engine::hash_secret(password, salt)
  #   self.password_digest = salt + hashed
  # end
  #
  # def authenticate(password)
  #   salt = password_digest[0..28]
  #   hashed = BCrypt::Engine::hash_secret(password, salt)
  #   return nil unless (salt + hashed) == self.password_digest
  #   self
  # end

    def most_recent
      Destination.last.name
    end 

    def first_visited
      Destination.first.name
    end

    def visit_count
      self.visits.count
    end

    def self.most_visits
    hash = Hash.new{0}

    Visit.all.each {|visit| hash[visit.user_id] += 1}

    most_popular = hash.max_by{|key, val| val}[0]
    
    User.find(most_popular).full_name
  end

  def unique_visit_count
    self.destinations.map {|destination| destination.name}.uniq.count
  end

  def self.most_uniq_destinations
    hash = Hash.new{}

    User.all.each {|user| hash[user.id] = user.unique_visit_count}
    
    most_unique_visited = hash.max_by{|key, val| val}[0]

    User.find(most_unique_visited).full_name
  end

end
