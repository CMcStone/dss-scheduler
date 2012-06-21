class Person < ActiveRecord::Base
  validate :must_have_uid_or_guest
  before_validation :generate_guest_token_if_needed
  
  has_many :reservations
  
  # attr_accessible :title, :body
  def role_symbols
    [:admin] #return symbols indicating roles
  end
    
  private
  
  # Ensure person has either a UID or both guest fields (token, email) filled out
  def must_have_uid_or_guest
    if uid.nil?
      if guest_token.nil? or guest_email.nil?
        errors.add(:guest_email, "must be set if uid is nil")
      end
    end
  end
  
  # Generates a guest token if they're a guest (guest_email set but uid not set)
  def generate_guest_token_if_needed
    # STUB
  end
end
