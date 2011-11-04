def logged_in?
  cookies[:bcoder_lgn] == 'somehash'
end

Given /^It's a (fresh|set-up) site$/ do |state|
  if state == 'set-up'
    Factory.create(:siteconfig) 
    SiteConfig.first.should_not == nil
  end
end

Given /^I am viewing (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am (not )?logged in$/ do |negated|
  if negated
    cookies[:bcoder_lgn] = nil
  else
    cookies[:bcoder_lgn] = 'somehash'
  end
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

