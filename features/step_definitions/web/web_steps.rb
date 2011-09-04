When /^I enter the base url$/ do
  visit '/'
end

Then /^I should see the homepage$/ do
  current_path.should == '/'
end

