Given /^It's a (fresh|set-up) site$/ do |state|
  if state == 'set-up'
    Factory.create(:siteconfig) 
    SiteConfig.first.should_not == nil
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should be viewing (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

