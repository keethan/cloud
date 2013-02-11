Feature: TC01.03, 01.04, 01.05, 01.06 Cloud OOBE for a new user

Scenario: Delete Subcsiption for an existing user
When I login to cloud delete subcription api web page with 'cloud2x-testing' and 'Eb6E322Du'
Then I delete the subscription for '491720410129'
Then I take screen shot of web page

Scenario: Cloud client first launch for a new user with no pictures in device and cloud
Given I do not have any files in the device
Given cloud app is running on the device
Then I take a screenshot
Then I should see Safe storage and Automatic upload instruction and I  navigate to next page
Then I sign up with 'aiosamy12@gmail.com' as email address and 'Keethan12' as password
Then I should see content backup and how to backup settings
Then I take a screenshot
Then I proceed with the client to backup later
Then I am successfully login to cloud app with option to take a photo
Then I take a screenshot


Scenario: Delete Subcsiption for an existing user
When I login to cloud delete subcription api web page with 'cloud2x-testing' and 'Eb6E322Du'
Then I delete the subscription for '491720410129'
Then I take screen shot of web page

Scenario: Cloud client first launch for a new user with pictures in device and not in cloud
Given I do have picture in the device
Given cloud app is running on the device
Then I take a screenshot
Then I should see Safe storage and Automatic upload instruction and I  navigate to next page
Then I sign up with 'aiosamy12@gmail.com' as email address and 'Keethan12' as password
Then I should see content backup and how to backup settings
Then I take a screenshot
Then I proceed with the client to backup later
Then I am successfully login to cloud app with recently added items with backup now option
Then I take a screenshot
