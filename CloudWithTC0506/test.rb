require 'watir-webdriver'
browser = Watir::Browser.new
#go to a page that won't bring up the authentication dialog...
#browser.goto 'http://www.google.co.uk'

#prepare the script...
#pass_man_update_script = <<-SCRIPT
#var addCredentialsEvent = new CustomEvent("add_credentials_to_passman", {
  #detail: {
   # host: 'https://survey.vfnet.de',
  #  username: 'cloud2x-testing',
 #   password: 'Eb6E322Du'
#  }
#});
#window.dispatchEvent(addCredentialsEvent);
#SCRIPT

#inject the script into the browser:
#browser.execute_script pass_man_update_script

#go to the page that prompts the dialog box...
browser.goto "https://cloud2x-testing:Eb6E322Du@survey.vfnet.de/gigui/individuals/index"
#you should now be past the dialog box!
