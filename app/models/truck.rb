class Truck
  include Mongoid::Document
  include Mongoid::FullTextSearch
  include Mongoid::Spacial::Document

  field :name, :type => String
  field :twitter, :type => String
  field :city, :type => String
  field :location, :type => Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }

  has_and_belongs_to_many :users

  after_save :update_index
  after_create :update_index
  after_update :update_index
  after_destroy :update_index 

  def update_index
    Truck.update_ngram_index
  end

end
