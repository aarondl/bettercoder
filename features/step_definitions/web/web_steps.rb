Given /^It's a fresh site$/ do
  siteconfig = SiteConfig.any_of
  siteconfig.should != nil
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

