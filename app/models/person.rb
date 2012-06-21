class Person < ActiveRecord::Base
  # attr_accessible :title, :body
  def role_symbols
    [:admin] #return symbols indicating roles
  end
  
  has_many :reservations
end
