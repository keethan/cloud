require 'watir-webdriver' 
require 'test/unit'
include Test::Unit::Assertions




# Android Client

Given /^I do not have any files in the device$/ do
system 'adb shell pm clear com.vodafone.cloud2'
end

Given /^cloud app is running on the device$/ do
  $startTime = Time.now.to_f
  start_test_server_in_background


count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'textView_safe_storage_splashscreen_descr'").to_s.include? 'textView_safe_storage_splashscreen_descr') == true
break
else
count = count + 1
 if ((query("textview id:'textView_safe_storage_splashscreen_descr'").to_s.include? 'textView_safe_storage_splashscreen_descr') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Safe storage details view was not able to show up in time'
exit
else end 
end
end
elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;startup|OOBE startup time for cloud app;time="+elapsedTime.to_s+"s"
#rescue Exception => e

 #       puts "SERVICE_ERROR;service=cloud;use_case=oobe;error_desc=Safe storage details view was not able to show up in time"
  #      raise e
#end
end

Then /^I should see Safe storage and Automatic upload instruction and I  navigate to next page$/ do
performAction('wait_for_view_by_id', 'buttonnext_safestorage_splashscreen')
performAction('click_on_view_by_id', 'buttonnext_safestorage_splashscreen')
count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'textView_automatic_upload_splashscreen_descr'").to_s.include? 'textView_automatic_upload_splashscreen_descr') == true
break
else
count = count + 1
 if ((query("textview id:'textView_automatic_upload_splashscreen_descr'").to_s.include? 'textView_automatic_upload_splashscreen_descr') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Automatic upload details view was not able to show up in time'
exit
    else end
end
end
performAction('wait_for_view_by_id', 'buttonnext_safestorage_splashscreen')
performAction('click_on_view_by_id', 'buttonnext_safestorage_splashscreen')
$startTime = Time.now.to_f
end

Then /^I should see login page of '(.*)'$/ do |msisdn|
count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'login_userid_info'").to_s.include? msisdn) == true
break
else
count = count + 1
 if ((query("textview id:'login_userid_info'").to_s.include? msisdn) == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Account status was not able to show up in time'
exit
    else end
end
end
elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;status|OOBE time for checking account status;time="+elapsedTime.to_s+"s"
end


When /^I proceed with login$/ do
performAction('press_button_with_text', 'Log in')
$startTime = Time.now.to_f
end

Then /^I should see content backup and how to backup settings$/ do

count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'textview_backup_media_type_choices_descr'").to_s.include? 'textview_backup_media_type_choices_descr') == true
break
else
count = count + 1
 if ((query("textview id:'textview_backup_media_type_choices_descr'").to_s.include? 'textview_backup_media_type_choices_descr') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Not able login in time'
exit
    else end
end
end
elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;login|OOBE login time;time="+elapsedTime.to_s+"s"
performAction('wait_for_view_by_id', 'button_next_step')
performAction('click_on_view_by_id', 'button_next_step')


count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'textview_backup_choices_descr'").to_s.include? 'textview_backup_choices_descr') == true
break
else
count = count + 1
 if ((query("textview id:'textview_backup_choices_descr'").to_s.include? 'textview_backup_choices_descr') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Automatic backup setting was not shown in time'
exit
    else end
end
end


end


Then /^I proceed with the client to backup later$/ do
performAction('wait_for_view_by_id', 'button_backup_later')
performAction('click_on_view_by_id', 'button_backup_later')
end

Then /^I am successfully login to cloud app with option to take a photo$/ do

count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'texts_hint_nophoto'").to_s.include? 'texts_hint_nophoto') == true
break
else
count = count + 1
 if ((query("textview id:'texts_hint_nophoto'").to_s.include? 'texts_hint_nophoto') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Cloud main page was not shown in time'
exit
    else end
end
end
performAction('wait_for_view_by_id', 'button_open_camera')
end


def waittillviewisshown(viewid)
count = 1  
while (count <=100)
sleep 0.2
if (query("textview id:'textview_backup_media_type_choices_descr'").to_s.include? 'textview_backup_media_type_choices_descr') == true
break
else
count = count + 1
 if ((query("textview id:'textview_backup_media_type_choices_descr'").to_s.include? 'textview_backup_media_type_choices_descr') == false && count >= 100) then
        macro 'I take a screenshot'
        puts 'Not able login in time'
exit
    else end
end
end
end
