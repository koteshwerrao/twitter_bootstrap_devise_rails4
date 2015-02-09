class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Validations
   validates :first_name,:last_name,:secretcode,:presence => true
  #Associaions
    has_one :secret_code
  #Callbacks
  after_save :update_secret_code


def update_secret_code
  @secretcode = SecretCode.where(:secretcode => self.secretcode).first
  @secretcode.user_id = self.id
   @secretcode.save
  end
end
