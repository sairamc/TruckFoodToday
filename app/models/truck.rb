class Truck
  include Mongoid::Document
  include Mongoid::FullTextSearch
  include Mongoid::Spacial::Document
  #include Geocoder::Model::Mongoid  

  field :name, :type => String
  field :twitter, :type => String
  field :city, :type => String
  field :address, :type => String
  field :location, :type => Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }


  # geocoded_by :address               # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates

  # reverse_geocoded_by :location
  # after_validation :reverse_geocode  # auto-fetch address

  has_and_belongs_to_many :users

  # after_save :update_index
  # after_create :update_index
  # after_update :update_index
  # after_destroy :update_index 

  # def update_index
  #   Truck.update_ngram_index
  # end

end
