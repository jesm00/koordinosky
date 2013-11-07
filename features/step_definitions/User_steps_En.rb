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

When(/^I click link number "(.*?)" in table "(.*?)" in row "(.*?)" in column "(.*?)"$/) do |number,table,row,column| 
  page.find(:xpath,'//table[@id="'+table+'"]/tbody/tr['+row+']/td['+column+']/a['+number+']').click
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

When(/^I check "(.*?)"$/) do |checkBox|
  check checkBox
end

Then(/^I should see field "(.*?)" with value "(.*?)"$/) do |field, exValue|
  find_field(field).value.should eq exValue
end

Then(/^I should see content "(.*?)" in table "(.*?)" in the position "(.*?)", "(.*?)"$/) do |text, table, row, column|
  	within (first('table#'+table+' tr:nth-child('+row+') td:nth-child('+column+')')) do
  		page.should have_content text
	end


end
