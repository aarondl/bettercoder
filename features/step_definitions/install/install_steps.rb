When /^I enter the install form details$/ do
  fill_in 'First name:', :with => 'Firstname'
  fill_in 'Last name:', :with => 'Lastname'
  fill_in 'E-mail address:', :with => 'first_last@somehost.net'
  fill_in 'Password:', :with => 'testpwd'
  fill_in 'Confirm password:', :with => 'testpwd'
  click_on 'Install'
end

Then /^I should see a success message$/ do
  page.has_content?('Congratulations')
end

