require 'calabash-android/management/adb'
require 'calabash-android/operations'
include Calabash::Android::Operations

#Before do |scenario|
      #$startTime = Time.now.to_f
  #start_test_server_in_background

#end

After do |scenario|
  if scenario.failed?
   begin
  screenshot_embed
  shutdown_test_server
  $indevice=0
rescue Exception => e
  puts "Shutting down the test server"
end
else
 # shutdown_test_server
end
end
