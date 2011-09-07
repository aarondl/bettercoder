When /^I enter the install form details$/ do
  fill_in 'First Name:', :with => 'Firstname'
  fill_in 'Last Name:', :with => 'Lastname'
  fill_in 'E-Mail:', :with => 'first_last@somehost.net'
  fill_in 'Password:', :with => 'testpwd'
  fill_in 'Confirm Password:', :with => 'testpwd'
  click_on 'Install'
end

