When /^I enter my log in details$/ do
end

When /^I click log out$/ do
  click_on 'Logout'
end

Then /^I should see a logged out message$/ do
  page.should have_content('logged out')
end

