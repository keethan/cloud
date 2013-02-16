
Before do |scenario|

end

After do |scenario|
  if scenario.failed?

begin
screenshot_embed
shutdown_test_server
rescue Exception => e
puts ' Taking screen shot and shutding down test server'
end

if $browser.exist? 
takewebscreenshot
$webscreenshot_count += 1
$browser.close
else
end
Cucumber.wants_to_quit = true
else
# pass case
#if $browser.exist? 
#$browser.close



if $donefirstscenario==1
system 'adb push /home/keethan/Downloads/pictureforcloud.jpeg /sdcard/pictureforcloud.jpeg'
sleep 2
system 'adb reboot'
sleep 80
else
end
end
end

After('@client-nopic') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
  $indevice=0
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-pic') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
  $indevice=0
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-cloudpic') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
  $indevice=0
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-cloudpic-upload') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
  $indevice=0
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end
