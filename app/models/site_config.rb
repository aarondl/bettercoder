class SiteConfig
  include Mongoid::Document
  include Mongoid::Timestamps
  field :fname, :type => String
  field :lname, :type => String
  field :email, :type => String
  field :salt, :type => String
  field :password, :type => String
  validates :fname, :presence => { :message => '^First name can\'t be blank' }
  validates :lname, :presence => { :message => '^Last name can\'t be blank' }
  validates :email, :presence => { :message => '^E-mail can\'t be blank' }
  validates :password, :confirmation => { :message => '^Password must match confirmation' },
    :presence => { :message => '^Password can\'t be blank' }
end
