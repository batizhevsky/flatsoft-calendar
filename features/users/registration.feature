Feature: Регистрация
  Для доступа к календарю
  Пользователь
  Должен зарегистрироваться

  Background: 
    Given I am not logged in

  Scenario: Пользователь регистриуется в с нормальыми данными(без имени)
    When I register with valid data
    Then I should see a success message

  Scenario: Пользователь регистриуется в с нормальыми данными(с именем)
    When I register with full and valid data
    Then I should see a success message

  Scenario: Пользователь регистритуется с неправельным email
    When I register with invalid email
    Then I should see a error email message

  Scenario: Пользователь регистрируется без пароля
    When I register without password
    Then I should see a blank password message

  Scenario: Пользователь регистритуется с несовпадающими паролями
    When I register with mismatch password
    Then I should see a error password message