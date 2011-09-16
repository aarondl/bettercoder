require 'spec_helper'

describe SiteConfig do

  it 'can be saved and retrieved' do
    f = Factory.create(:siteconfig)
    f = nil
    f.should be_nil
    f = SiteConfig.first
    o = Factory.build(:siteconfig)
    f.should_not be_nil
    o.should_not be_nil
    f.fname.should eq(o.fname)
    f.lname.should eq(o.lname)
    f.email.should eq(o.email)
    f.salt.should eq(o.salt)
    f.password.should eq(o.password)
  end

  it 'should confirm passwords' do
    expect {
      Factory.create(
        :siteconfig,
        :password_confirmation => 'lol'
      )
    }.to raise_error(Mongoid::Errors::Validations)
  end
end

