@Regression
Feature: Updaing an account car

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('CreateAccount.feature')
    * def validToken = createAccountResult.validToken
    * def generatedAccountId = createAccountResult.response.id

  Scenario: Update exising car info from and account.
    #Create and add car first to the account.
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = generatedAccountId
    And request
      """
      {
      "make": "Ford",
      "model": "Mustang",
      "year": "2018",
      "licensePlate": "VA-1234"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == "VA-1234"
    And assert response.make == "Ford"
    And assert response.year == "2018"
    * def carId = response.id
    #Updating exisint account car
    And path "/api/accounts/update-account-car"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = generatedAccountId
    And request
      """
      {
      "id": "#(carId)",
      "make": "Ford",
      "model": "Mustang",
      "year": "2023",
      "licensePlate": "VA-4321"
      }
      """
    When method put
    And print response
    Then status 202
    And assert response.licensePlate == "VA-4321"
    And assert response.make == "Ford"
    And assert response.year == "2023"
