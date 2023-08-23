#This feature is to test Register account holder
#Required and exisiting account
#required random username
@Regression
Feature: Register new user and new account

  Background: Setup tests and crate new account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('CreateAccount.feature')
    * def accountId = createAccountResult.response.id
    * def fullName = createAccountResult.response.firstName + " " + createAccountResult.response.lastName

  Scenario: Sign up and register new user
    Given path "/api/sign-up/register"
    * def dataGenerator = Java.type('api.utility.data.GenerateData')
    * def auto_username = dataGenerator.getUsername()
    And request
      """
      {
      "primaryPersonId": "#(accountId)",
      "fullname": "#(fullName)",
      "username": "#(auto_username)",
      "password": "Tek@1234",
      "authority": "CUSTOMER",
      "accountType": "CUSTOMER"
      }
      """
    When method post
    Then print response
    Then status 201
    And assert response.username == auto_username
    And assert response.fullName == fullName
    And assert response.accountType == "CUSTOMER"