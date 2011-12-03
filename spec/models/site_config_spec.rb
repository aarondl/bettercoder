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
    f.salt.should_not eq(o.salt)
    f.password.should_not eq(o.password)
  end

  it 'should confirm passwords' do
    expect {
      Factory.create(
        :siteconfig,
        :password_confirmation => 'lol'
      )
    }.to raise_error(Mongoid::Errors::Validations)
  end

  it 'should require all fields except salt' do
    expect {
      Factory.create(
        :siteconfig,
        :fname => '', :lname => '', :email => '',
        :password => '', :password_confirmation => ''
      )
    }.to raise_error(Mongoid::Errors::Validations)
    expect {
      Factory.create(
        :siteconfig,
        :salt => ''
      )
    }.to_not raise_error(Mongoid::Errors::Validations)
  end

  it 'should store passwords as a hash' do
    a = Factory.create(:siteconfig)
    b = Factory.build(:siteconfig)
    a.password.should_not eq(b.password)
  end

  it 'should force emails to be valid' do
    expect {
      Factory.create(:siteconfig, :email => 'lol')
    }.to raise_error(Mongoid::Errors::Validations)
  end

  it "should verify siteconfigs to see if they have the right pwd" do
    a = Factory.create(:siteconfig)
    b = Factory.build(:siteconfig, :salt => nil, :fname => nil, :lname => nil)
    c = Factory.build(:siteconfig, :password => 'insanity', :salt => nil, :fname => nil, :lname => nil)
    SiteConfig::verify_password(a, b).should be_true
    SiteConfig::verify_password(a, c).should be_false
  end
end

