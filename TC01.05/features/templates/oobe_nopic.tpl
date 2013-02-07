Feature: TC01.03, 01.04, 01.05 Cloud OOBE for an existing user and no pictures in the device
 and in cloud

Scenario: Cloud client first launch for an existing user 
with no pictures in device and cloud
Given I do not have any files in the device
Given cloud app is running on the device
Then I take a screenshot
Then I should see Safe storage and Automatic upload instruction and I  navigate to next page
Then I should see login page of '<MSISDN>' 
Then I take a screenshot
When I proceed with login
Then I should see content backup and how to backup settings
Then I take a screenshot
Then I proceed with the client to backup later
Then I am successfully login to cloud app with option to take a photo
Then I take a screenshot
