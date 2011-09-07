class SiteConfig
  include Mongoid::Document
  include Mongoid::Timestamps
  field :fname, :type => String
  field :lname, :type => String
  field :email, :type => String
  field :salt, :type => String
  field :pwdhash, :type => String
end
