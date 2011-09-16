class SiteConfig
  include Mongoid::Document
  include Mongoid::Timestamps
  field :fname, :type => String
  field :lname, :type => String
  field :email, :type => String
  field :salt, :type => String
  field :password, :type => String
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :email, :presence => true
  validates :password, :confirmation => true, :presence => true
end
