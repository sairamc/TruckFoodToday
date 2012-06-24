class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name
  field :email
  field :encrypted_password
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip
  field :sign_in_count
  field :remember_created_at
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :trucks
end

