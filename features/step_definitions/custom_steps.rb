require 'watir-webdriver' 
require 'test/unit'
include Test::Unit::Assertions





class BrowserContainer

     def initialize(browser)
     $browser = browser
end
end

class Site < BrowserContainer

  def login_page
   @login_page = LoginPage.new($browser)
end

  def user_page
   @user_page = UserPage.new($browser)
   end

  def close
    $browser.close
end
end # Site

class LoginPage < BrowserContainer

 def open
  $browser.goto $URL
    self
end

  def login_as(user, pass)
    user_field.set user
    password_field.set pass
    login_button.click
sleep 3
    next_page = UserPage.new($browser)
    Watir::Wait.until { next_page.loaded? }
    next_page
  end

  def user_field
    $browser.text_field(:name => "username")
  end

  def password_field
   $browser.text_field(:type => "password")
  end

  def login_button
    $browser.button(:class => "buttonAubergine")
  end
end # LoginPage

class UserPage < BrowserContainer

  def logged_in?
  Watir::Wait.until {$browser.div(:id => 'paginationLeft').exist?}
  assert_equal($browser.span(:id => "menu-settings-account-name").exists? , true)
# next_page = Webscreenshottaker.new($browser)
  end

  def loaded?
    $browser.title == "Your Profile"
     next_page = UserPage.new($browser)
  end
end # UserPage


module SiteHelper
  def site
$webscreenshot_count ||= 0
    @site ||= (
      Site.new(Watir::Browser.new(:firefox))
    )
end
end


class Picturupload < BrowserContainer

def uploadpicture 
Watir::Wait.until { $browser.link(:id => 'upload').exists? }
$browser.link(:id => 'upload').click
next_page=Simpleupload.new($browser)
end
end

class Simpleupload < BrowserContainer

def simpleuploadpicture 
Watir::Wait.until { $browser.link(:id => 'showSimpleUpload').exists? }
$browser.link(:id => 'showSimpleUpload').click
next_page=Upload.new($browser)
end
end

class Upload < BrowserContainer

def uploadpicturefile(img)
#local_file='/home/keethan/Downloads/Buddha8.jpeg' 
$Picturepath = '/home/keethan/Downloads/Buddha8.jpeg'
#$Picturename = 'Buddha8.jpeg'
Watir::Wait.until { $browser.file_field.exists? }
$browser.file_field(:multiple => 'true').set $Picturepath
$browser.link(:id => 'html5UploadButton').click
Watir::Wait.until{$browser.link(:title => img).exist?}
end
end

class Picture < BrowserContainer

def openpicture(img3)
$browser.link(:title => img3).exist?
#$browser.link(:title => img3).click
#Watir::Wait.until{$browser.img(:id => 'media_file').exist?}
end
end


class Myfiles < BrowserContainer

def myfilesmenu(img1) 
Watir::Wait.until { $browser.link(:id => 'myfiles').exists? }
$browser.link(:id => 'myfiles').click
sleep 2
Watir::Wait.until{$browser.div(:class => 'thumbnail folderRow small_').exist?}
assert_equal($browser.text.include?(img1), false)
end
end




World(SiteHelper)


def takewebscreenshot 
$screenshotname = "webscreenshot#{$webscreenshot_count}.png"
$browser.screenshot.save($screenshotname)
embed $screenshotname, 'image/png'
$webscreenshot_count += 1
end 

def findurl(opco)
case opco

when 'Germany'
$URL='https://cloud-pp.vodafone.de/'
else
puts "URL for OpCo  #{opco}  does not found"
end
end




Given /^I login to cloud '(.*)' server with '(.*)' as user and '(.*)' as password$/ do |opco, username,password|

findurl(opco)
   @login_page = site.login_page.open
   user_page = @login_page.login_as(username,password)
  user_page.logged_in?
   #site.close

end

Then /^I take a screenshot of the cloud server customer page$/ do
 takewebscreenshot
end

Then /^I upload '(.*)' picture to the cloud server$/ do |img|
picturupload=Picturupload.new($browser)
simpleupload=picturupload.uploadpicture
upload=simpleupload.simpleuploadpicture
upload.uploadpicturefile(img)
end

Then /^I should see the '(.*)' picture is uploaded in the cloud server$/ do |img3|
picture=Picture.new($browser)
picture.openpicture(img3)
end



Then /^I should not see '(.*)' picture in cloud server$/ do |img1|
myfiles = Myfiles.new($browser)
myfiles.myfilesmenu(img1)
end


Then /^I take a screenshot of the cloud server myfiles page$/ do
takewebscreenshot
$browser.close
shutdown_test_server
end

# Android Client
Given /^cloud app is running in the device$/ do
      $startTime = Time.now.to_f
  start_test_server_in_background

begin
count = 1
  
while (count <=100)
sleep 0.2

#puts (query("gridview id:'latestImages'").to_s.include? 'latestImages')
if (query("gridview id:'latest_items_preview'").to_s.include? 'latest_items_preview') == true
break
else
count = count + 1
 if ((query("gridview id:'latest_items_preview'").to_s.include? 'latest_items_preview') == false && count >= 100) then
        macro 'I take a screenshot'
        assert(false ,'Latest uploaded picture was not able to show up in time')
exit
    else end
end

end

elapsedTime = Time.now.to_f - $startTime
   puts "KPI-For-Nagios: cloud;startup|Startup time for cloud app till the menu button being displayed;time="+elapsedTime.to_s+"s"
rescue Exception => e

        puts "SERVICE_ERROR;service=cloud;use_case=picture up load;error_desc=uploaded picture did not appear in cloud main page"
        raise e
end
end




Then /^I open the cloud photos menu$/ do
performAction('wait_for_view_by_id','menu_button')
performAction('click_on_view_by_id','menu_button')
performAction('wait_for_view_by_id','sliding_menu_item_photos')
performAction('click_on_view_by_id','sliding_menu_item_photos')
end

Then /^I should see the uploded 'Buddha8.jpeg' picture$/ do

count = 1
  
while (count <=10)
sleep 1

#puts (query("imageview id:'media_griditem_thumbnail'").to_s.include? 'media_griditem_thumbnail')
if ((query("imageview id:'media_griditem_thumbnail'").to_s.include? 'media_griditem_thumbnail') == true)
assert_equal((query("textview id:'backup_status_text'").to_s.include? '1 photo'), true)
break
else
performAction('go_back')
performAction('wait_for_view_by_id','menu_button')
performAction('click_on_view_by_id','menu_button')
performAction('wait_for_view_by_id','sliding_menu_item_photos')
performAction('click_on_view_by_id','sliding_menu_item_photos')
count = count + 1
 if ((query("imageview id:'media_griditem_thumbnail'").to_s.include? 'media_griditem_thumbnail') == false && count >= 10) then
        macro 'I take a screenshot'
        assert(false ,'Upload picture was not able to show up in time')
exit
    else end
end

end
end



Then /^I take a screenshot in the device$/ do
screenshot_embed
end

Then /^I open the uploaded picture$/ do
performAction('wait_for_view_by_id' , 'media_griditem_thumbnail')
performAction('click_on_view_by_id' , 'media_griditem_thumbnail')
#performAction('wait_for_view_by_id' , 'photos_view_pager')
performAction('wait_for_view_by_id','photos_view_pager_item_imageview')
end

And /^I delete the picture$/ do
performAction('select_from_menu', 'Delete')
performAction('wait_for_view_by_id' , 'delete_file_ok_button')
performAction('click_on_view_by_id' , 'delete_file_ok_button')
sleep 2
performAction('wait_for_view_by_id' , 'delete_file_done_button')
sleep 2
performAction('click_on_view_by_id' , 'delete_file_done_button')
performAction('wait_for_view_by_id','menu_button')
sleep 1
#assert_equal((query("imageview id:'media_griditem_thumbnail'").to_s.include? 'media_griditem_thumbnail'), false)
assert_equal((query("textview id:'backup_status_text'").to_s.include? '0 photos'), true)
end
