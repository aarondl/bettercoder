def logged_in?
  cookie = get_me_the_cookie('bcoder_lgn')
  cookie && cookie[:value] && !cookie[:value].empty?
end

Given /^It's a (fresh|set-up) site$/ do |state|
  if state == 'set-up'
    Factory.create(:siteconfig)
    SiteConfig.first.should_not == nil
  end
end

Given /^I am (not )?logged in$/ do |negated|
  if negated
    visit path_to('the log out page')
  else
    Given "It's a set-up site"
    Given "I go to the log in page"
    Given "I enter my log in details"
  end
end

Given /^I am viewing (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should be viewing (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

Then /^I should (not )?have a login cookie$/ do |negated|
  if negated
    logged_in?.should be_false
  else
    logged_in?.should be_true
  end
end

