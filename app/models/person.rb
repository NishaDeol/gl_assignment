class Person < ApplicationRecord
  validate :phone_field_format
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, :presence => {:message => 'hello world, bad operation!'},
                    :numericality => true,
                    :length => { :minimum => 11, :maximum => 11 }

  def phone_field_format
  	errors.add(:phone, "number should start with +") unless self.phone.start_with?('+')
  end
	
end
