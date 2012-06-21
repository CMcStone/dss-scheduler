class Person
  # attr_accessible :title, :body
  def role_symbols
    [:admin] #return symbols indicating roles
	#(roles || []).map {|r| r.title.to_sym}
  end

end
