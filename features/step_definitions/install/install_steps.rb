When /^I enter (some|the) install form details$/ do |amount|
  fill_in 'First name:', :with => 'Firstname'
  fill_in 'Last name:', :with => 'Lastname'
  if amount != 'some'
    fill_in 'E-mail address:', :with => 'first_last@somehost.net'
  end
  fill_in 'Password:', :with => 'testpwd'
  fill_in 'Confirm password:', :with => 'testpwd'
  click_on 'Install'
end

Then /^I should see a (failure|success) message$/ do |msg|
  if msg == 'success'
    page.should have_content('Congratulations')
  else
    page.should have_content('Error')
  end
end

