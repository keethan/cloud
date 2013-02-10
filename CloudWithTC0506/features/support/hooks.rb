
Before do |scenario|

end

After do |scenario|
  if scenario.failed?
screenshot_embed
takewebscreenshot
$webscreenshot_count += 1
$browser.close
shutdown_test_server
  else
shutdown_test_server
$browser.close
if $donefirstscenario==1
system 'adb shell /system/bin/screencap -p /sdcard/pictureforcloud.png'
sleep 2
system 'adb reboot'
sleep 80
else
end
end
end
