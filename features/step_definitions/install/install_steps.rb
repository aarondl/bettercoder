When /^I enter (some|the|bad) install form details$/ do |amount|
  fill_in 'First name:', :with => 'Firstname'
  fill_in 'Last name:', :with => 'Lastname'
  if amount == 'the'
    fill_in 'E-mail address:', :with => 'first_last@somehost.net'
  elsif amount == 'bad'
    fill_in 'E-mail address:', :with => 'lolhursmyemail'
  end
  fill_in 'Password:', :with => 'testpwd'
  fill_in 'Confirm password:', :with => 'testpwd'
  click_on 'Install'
end

Then /^I should see a (failure|success) message$/ do |msg|
  if msg == 'success'
    page.should have_content('Congratulations')
  else
    page.should have_content('E-mail can\'t be blank')
  end
end

Then /^I should see an error that says: E\-mail must be a valid e\-mail address$/ do
  page.should have_content('E-mail must be a valid e-mail address')
end

