
Before do |scenario|

end

After do |scenario|
  if scenario.failed?

begin
screenshot_embed
rescue NoMethodError => e
  puts "Cloud app is not yet started" 
  end 
begin 
takewebscreenshot
$webscreenshot_count += 1
rescue NoMethodError => e
  puts "Browser is already closed" 
  end 

begin
$browser.close
rescue NoMethodError => e
  puts "Browser is already closed" 
  end 
  
begin
shutdown_test_server
rescue NoMethodError => e
  puts "Shuting down the test server"  
 end 


begin 
deletepicture
rescue RuntimeError => e
puts 'Delete picture from cloud'
end

begin
deletemsisdn
rescue RuntimeError => e
puts 'Delete subscription'
end

Cucumber.wants_to_quit = true
puts ' Scenario fail stopping the test run '
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
