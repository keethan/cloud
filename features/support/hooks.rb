
Before do |scenario|

end

After do |scenario|
  if scenario.failed?

if $browser.exist? 
takewebscreenshot
$webscreenshot_count += 1
$browser.close
else
end
else
#pass case
#if $browser.exist? 
#$browser.close
#else
#end
end

end

