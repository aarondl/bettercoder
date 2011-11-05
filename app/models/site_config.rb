class SiteConfig
  include Mongoid::Document
  include Mongoid::Timestamps

  Email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_save :hash_password

  field :fname, :type => String
  field :lname, :type => String
  field :email, :type => String
  field :salt, :type => String
  field :password, :type => String
  validates :fname, :presence => { :message => '^First name can\'t be blank' }
  validates :lname, :presence => { :message => '^Last name can\'t be blank' }
  validates :email,
    :presence => { :message => '^E-mail can\'t be blank' },
    :format => { :with => Email_regex, :message => '^E-mail must be a valid e-mail address' }
  validates :password,
    :confirmation => { :message => '^Password must match confirmation' },
    :presence => { :message => '^Password can\'t be blank' }

  def self.verify_password(authority, siteconfig)
    return false if authority.nil?
    return BCrypt::Engine.hash_secret(siteconfig.password, authority.salt) == authority.password
  end

  protected
  def hash_password
    if self.password != nil
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
    end
  end
end
