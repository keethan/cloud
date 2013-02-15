
Before do |scenario|

end

After do |scenario|
  if scenario.failed?
screenshot_embed
takewebscreenshot
$webscreenshot_count += 1
$browser.close
shutdown_test_server
  end
#shutdown_test_server
end
