Feature: TC01.03, 01.04, 01.06 Cloud OOBE for an existing user and with pictures in the device and not in cloud

Scenario: Cloud client first launch for an existing user with  pictures in device and not in cloud
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
Then I am successfully login to cloud app with items recently added on the device
Then I take a screenshot
