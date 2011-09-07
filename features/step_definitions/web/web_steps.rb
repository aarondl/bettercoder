Given /^It's a (fresh|stale) site$/ do |state|
  siteconfig = SiteConfig.any_of
  if state == 'fresh'
    siteconfig.should == nil
  elsif state == 'stale'
    siteconfig.should_not == nil
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

