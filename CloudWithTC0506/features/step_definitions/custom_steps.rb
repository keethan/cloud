require 'watir-webdriver' 
require 'test/unit'
include Test::Unit::Assertions

#At subscription deletion API web page

When /^I login to cloud delete subcription api web page with '(.*)' and '(.*)'$/ do |username, password|
$donefirstscenario=0
$webscreenshot_count = 0
$browser = Watir::Browser.new
url = 'https://'+username+':'+password+'@survey.vfnet.de/gigui/individuals/index'
$browser.goto url
Watir::Wait.until {$browser.text_field(:name => 'msisdn').exist?}
end

Then /^I delete the subscription for '(.*)'$/ do |msisdn|
$browser.text_field(:name => 'msisdn').set msisdn
$browser.button(:class => 'btn btn btn-danger').click
Watir::Wait.until {$browser.text.include? 'Deleted Entry with MSISDN 491720410129'}
end

def takewebscreenshot 
$screenshotname = "webscreenshot#{$webscreenshot_count}.png"
$browser.screenshot.save($screenshotname)
embed $screenshotname, 'image/png'
$webscreenshot_count += 1
end 

Then /^I take screen shot of web page$/ do
takewebscreenshot 
end

# Android Client

Given /^I do not have any files in the device$/ do
system 'adb shell pm clear com.vodafone.cloud2'
end

Given /^cloud app is running on the device$/ do
  $startTime = Time.now.to_f
  start_test_server_in_background
view='textview'
id ='textView_safe_storage_splashscreen_descr'
if waittillviewisshown(view,id)
elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;startup|OOBE startup time for cloud app;time="+elapsedTime.to_s+"s"
else
        macro 'I take a screenshot'
        puts 'Safe storage details view was not able to show up in time'
        exit
        end
end

Then /^I should see Safe storage and Automatic upload instruction and I  navigate to next page$/ do
performAction('wait_for_view_by_id', 'buttonnext_safestorage_splashscreen')
performAction('click_on_view_by_id', 'buttonnext_safestorage_splashscreen')
view='textview'
id ='textView_automatic_upload_splashscreen_descr'
if waittillviewisshown(view,id)
        performAction('wait_for_view_by_id', 'buttonnext_safestorage_splashscreen')
        performAction('click_on_view_by_id', 'buttonnext_safestorage_splashscreen')
         $startTime = Time.now.to_f
else
        macro 'I take a screenshot'
        puts 'Automatic upload details view was not able to show up in time'
        exit
        end
end

Then /^I sign up with '(.*)' as email address and '(.*)' as password$/ do |email,pass|
view='textview'
id='registration_userid_info'
if waittillviewisshown(view,id)
elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;status|OOBE time for checking account status;time="+elapsedTime.to_s+"s"
   performAction('wait_for_view_by_id', 'registration_email_input')
   performAction('enter_text_into_id_field', email, 'registration_email_input')
      performAction('wait_for_view_by_id', 'registration_password_input')
      performAction('enter_text_into_id_field', pass, 'registration_password_input')
      performAction('wait_for_view_by_id', 'registration_password_repeat')
      performAction('enter_text_into_id_field', pass, 'registration_password_repeat')
            performAction('wait_for_view_by_id', 'registration_terms_and_conditions_checkbox')
      performAction('click_on_view_by_id','registration_terms_and_conditions_checkbox')
      performAction('wait_for_view_by_id', 'registration_signup_button')
      performAction('click_on_view_by_id','registration_signup_button')
      $startTime = Time.now.to_f
      
else
        macro 'I take a screenshot'
        puts 'Account status was not able to show up in time'
        exit
        end
end


Then /^I should see content backup and how to backup settings$/ do
view='textview'
id = 'textview_backup_media_type_choices_descr'
if waittillviewisshown(view,id)
elapsedTime = Time.now.to_f - $startTime
puts "KPI-For-Nagios: cloud;signup|OOBE signup time;time="+elapsedTime.to_s+"s"

else
       macro 'I take a screenshot'
        puts 'Not able signup in time'
exit
end
performAction('wait_for_view_by_id', 'button_next_step')
performAction('click_on_view_by_id', 'button_next_step')
end


Then /^I proceed with the client to backup later$/ do
performAction('wait_for_view_by_id', 'button_backup_later')
performAction('click_on_view_by_id', 'button_backup_later')
end



Then /^I am successfully login to cloud app with option to take a photo$/ do
view='textview'
id='texts_hint_nophoto'
if waittillviewisshown(view,id)
performAction('wait_for_view_by_id', 'button_open_camera')
$donefirstscenario=1
$browser.close
else
        macro 'I take a screenshot'
        puts 'Cloud main page was not shown in time'
        exit
end
end


Given /^I do have picture in the device$/ do
system 'adb shell pm clear com.vodafone.cloud2'
end


Then /^I am successfully login to cloud app with recently added items with backup now option$/ do 
view='gridview'
id='latestImages'
if waittillviewisshown(view,id)
$donefirstscenario=0
$browser.close
else
        macro 'I take a screenshot'
        puts 'Cloud main page with recently added items was not shown in time'
        exit
end
end


def waittillviewisshown(view,id)
count = 1  
while (count <=200)
queryparam = "\""+view+ " id:'" + id + "'"
sleep 0.2
if (query(queryparam).to_s.include? id) == true
return true
else
count = count + 1
 if ((query(queryparam).to_s.include? id) == false && count >= 200) then
return false
else end 
end
end
end
