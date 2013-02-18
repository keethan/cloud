
Before do |scenario|

end

After do |scenario|
  if scenario.failed?

#begin
#screenshot_embed
#shutdown_test_server
#rescue Exception => e
#puts ' Taking screen shot and shutding down test server'
#end

if $browser.exist? 
takewebscreenshot
$webscreenshot_count += 1
$browser.close
else
end
#Cucumber.wants_to_quit = true
else
#pass case
if $browser.exist? 
$browser.close
else
end
end


#if $donefirstscenario==1
#system 'adb push /home/muthu/Downloads/pictureforcloud.jpeg /sdcard/pictureforcloud.jpeg'
#sleep 2
#system 'adb reboot'
#sleep 80
#else
#end
end

