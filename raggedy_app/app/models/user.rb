class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  has_many :products
  has_many :likes

  validates :username, uniqueness: true
  # has_many :products

  def to_param
  	username
  end

  def like_product(product)
    likes.find_by(product_id: product.id) || Like.new(product: product)
  end

  def liked?(product)
    not like_product(product).new_record?
  end

end
