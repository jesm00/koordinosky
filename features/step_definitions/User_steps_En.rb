Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |campo, entrada|
  fill_in(campo, :with => entrada)
end

When(/^I click "(.*?)"$/) do |button| 
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

When(/^I select "(.*?)" in "(.*?)"$/) do |option, box|
  select(option, :from => box)
end

Given(/^I am on give an invalid unit via through an url$/) do
  visit '/recibir_altura?altura=42&unidad=inc'
end

