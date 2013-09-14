Given(/^I am on the home page$/) do
  visit '/'
end

Given(/^I am on "(.*?)"$/) do |page|
  visit page
end

When(/^I select "(.*?)" in "(.*?)"$/) do |option, box|
  select(option, :from => box)
end

When(/^I click button "(.*?)"$/) do |button| 
  click_button(button)
end

When(/^I click link "(.*?)"$/) do |link| 
  page.find(:link,link).click
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |campo, entrada|
  fill_in(campo, :with => entrada)
end

When(/^I choose "(.*?)"$/) do |radio|
  page.choose(radio)
end

Then(/^I should see "(.*?)"$/) do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end



Given(/^I am on give an invalid unit via through an url$/) do
  visit '/recibir_altura?altura=42&unidad=inc'
end

