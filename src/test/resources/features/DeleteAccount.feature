#Account should be exist to delete. 200 Status code
#Make sure Account that is not exist to get 404 Status code.
@Regression
Feature: Delete Account functionality

  Background: Test Setup and Create New Account.
    * def createAccount = callonce read('CreateAccount.feature')
    * def validToken = createAccount.validToken
    * def createdAccountId = createAccount.response.id  
    And print createAccount
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Successfull delete account
  	Given path "/api/accounts/delete-account"
  	And param primaryPersonId = createdAccountId 
  	And header Authorization = "Bearer " + validToken
  	When method delete
  	Then status 200
  	And assert response == "Account Successfully deleted"
  	Given path "/api/accounts/delete-account"
  	And param primaryPersonId = createdAccountId
  	And header Authorization = "Bearer " + validToken
  	When method delete
  	Then status 404
  	And print response
  	And assert response.errorMessage == "Account with id " + createdAccountId + " not exist"
  	
	