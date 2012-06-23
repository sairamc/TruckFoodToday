class Favorite
  include Mongoid::Document
  belongs_to :user
  has_one :truck
end
