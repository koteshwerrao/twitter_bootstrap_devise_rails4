class SecretCode < ActiveRecord::Base
require "securerandom"

#Validations


#Associaions
belongs_to :user

#Callbacks
before_create :generate_new_code

#Generating Guid for when ever secretd code row is created
def generate_new_code
 if self.new_record?
   guid = SecureRandom.hex(10)
   self.secretcode = guid
 end
end 


end
