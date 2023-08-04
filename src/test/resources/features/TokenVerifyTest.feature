Feature: Token Verify Feature

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Verify a valid token
    And path "/api/token"
    And request {"username" : "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Then path "/api/token/verify"
    And param username = "supervisor"
    And param token = response.token
    When method get
    Then status 200
    And print response
    And assert response == "true"

  #Do Scenario # 5
  Scenario: Verify token with invalid username
    And path "/api/token"
    And request {"username" : "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Then path "/api/token/verify"
    And param username = "WrongUsername"
    And param token = response.token
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"

    #Do Scenario # 6