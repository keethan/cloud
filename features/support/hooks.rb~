
Before do |scenario|

end

After do |scenario|
puts ' cucumber shouldnot exit now vinay is saying '
  if scenario.failed?
  puts ' cucumber scenario failed exit now vinay is saying '
screenshot_embed
takewebscreenshot
$webscreenshot_count += 1
$browser.close
shutdown_test_server

Cucumber.wants_to_quit = true
puts ' cucumber should exit now Vinay is saying '
  else

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
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-pic') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-cloudpic') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end

After('@client-cloudpic-upload') do
begin
  #doc = Nokogiri::HTML(open(url))
  shutdown_test_server
rescue Errno::ECONNRESET => e
  puts "Restarting the test server"
end
end
