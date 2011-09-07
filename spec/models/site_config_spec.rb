require 'spec_helper'

describe SiteConfig do

  it 'can be saved and retrieved' do
    fname = 'Test'
    lname = 'Root'
    email = 'test@root.com'
    salt = 'cookies'
    pwdhash = 'abcedf'

    SiteConfig.create(
      fname: fname, lname: lname, email: email,
      salt: salt, pwdhash: pwdhash 
    )

    site_config = SiteConfig.first()
    site_config.should_not == nil

    site_config.fname.should == fname 
    site_config.lname.should == lname
    site_config.email.should == email
    site_config.salt.should == salt
    site_config.pwdhash.should == pwdhash
  end
end
