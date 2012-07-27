# encoding: utf-8

def create_user
  @visitor ||= { :username => "Tester ", :email => "test@example.com",
    :password => "qwerty", :password_confirmation => "qwerty" }
end

def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_email", with: @visitor[:email]
  fill_in "user_username", with: @visitor[:username]
  fill_in "user_password", with: @visitor[:password]
  fill_in "user_password_confirmation", with: @visitor[:password_confirmation]
  click_button "register"
  find_user
end

Given /^I am not logged in$/ do
  delete '/users/sign_out'
end

When /^I register with valid data$/ do
  create_user
  @visitor = @visitor.merge(username: "")
  sign_up
end

Then /^I should see a success message$/ do
  page.should have_content "Вы успешно зарегистрировались"
end

When /^I register with full and valid data$/ do
  create_user
  sign_up
end

When /^I register with invalid email$/ do
  create_user
  @visitor = @visitor.merge(email: "error")
  sign_up
end

Then /^I should see a error email message$/ do
  page.should have_content "Электронная почта имеет неверное значение"
end

When /^I register without password$/ do
  create_user
  @visitor = @visitor.merge(password: "")
  sign_up
end

Then /^I should see a blank password message$/ do
  page.should have_content "Пароль не может быть пустым"
end

When /^I register with mismatch password$/ do
  create_user
  @visitor = @visitor.merge(password_confirmation: "ytrewq" )
  sign_up
end

Then /^I should see a error password message$/ do
  page.should have_content "Пароль не совпадает с подтверждением"
end