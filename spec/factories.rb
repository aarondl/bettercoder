FactoryGirl.define do
  factory :siteconfig, :class => SiteConfig do |c|
    c.fname 'Testfname'
    c.lname 'Testlname'
    c.email 'test@test.com'
    c.salt '3hded3dddhedf'
    c.password 'password'
  end
end
