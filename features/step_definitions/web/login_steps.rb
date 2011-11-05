When /^I enter my log in details$/ do
  siteconfig = Factory.build(:siteconfig)
  fill_in 'E-mail address:', :with => siteconfig.email
  fill_in 'Password:', :with => siteconfig.password
  click_on 'Login'
end

When /^I click log out$/ do
  click_on 'Logout'
end

Then /^I should see a logged out message$/ do
  page.should have_content('logged out')
end

