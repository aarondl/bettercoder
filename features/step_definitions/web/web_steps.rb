Given /^It's a (fresh|stale) site$/ do |state|
  if state == 'stale'
    SiteConfig.create
    SiteConfig.first.should_not == nil
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

