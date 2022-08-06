# Unit Tests!!!

1) Why do we need Unit Tests?
    - We cannot touch, smell or feel the quality of the software like we can  
      with physical or visual objects
    - We have to relay on tests to verify the software quality
    - (bonus) Unit Tests must not be treated as 2nd class citizens

2) Does a programmer that can write code can write unit tests?
    - Such assumption is not necessary true, because:
        - You can write a piece of code that you are not understanding but,  
          it is nearly impossible to write a unit test code without  
          understanding what exactly is the actual code doing

3) What are Unit Tests and what are its characteristics?
    - *Unit* - is just a Metric unit (like: meter or kilometer for length), and  
      *it depends upon individual programmers*
    - A *Unit* can be 1..n Functions, 1..n lines of code or 1...n Objects...
    - The only criteria for *Unit* is capability of executing independently
    - Test(s) are written for for testing a *unit* of a code
    - Each Unit Tests runs independently of any other Unit Tests, Code etc
    - External Dependencies are Managed with Doubles (Mocks / Fakes / Stubs)
    - Unit Test(s) should complete within milliseconds

5) What is the purpose of Unit Tests?
    - The purpose of Unit Tests is to test the functionality of the code to  
      determine if it is working as expected or not
    - As a result we may find areas that are not working - and that will often  
      lead to finding bugs

6) How to write Unit Tests: Arrange - Act -Assert (3A rule)?
    - Arrange - we arrange(init) the data or the state of the function
    - Act - we execute our code under test
    - Assert - we verify the result of test whether it is as expected or no
    - Example:
        - ```
          TEST(SUM_TEST, Test_one)
          {
            // Arrange
            int value1 = 100;
            int value2 = 200;
            // Act
            int result = sum(value1, value2);
            // Assert
            ASSERT_EQ(result, (value1 + value2));
          }
          ```

7) How to use Test Doubles (Mocks / Fakes / Stubs)
    - Used in lieu of External Dependencies (DB, Web, API, Library, Network etc)
    - Isolating external dependencies to troubleshoot if the issue is coming  
      from our code or the backend (backend independent)
    - Simulate different scenarios


8) What are Mocks and when we use them?
    - Mocks replace external interface
    - Nowadays, we dont write mock code for most of the API interfaces we  
      utilize test frameworks that allow us to specify what will be mocked
    - Mocks are not used for checking function behaviour or return values  
      from the function call
    - We check if Mock function was called or NOT?
    - How many times function gets called?
    - What Parameters are passed when it was called?
    - Within the test we assert that:
        - The right call was made
        - The call was made the right number of times
        - The call was made with the right set of parameters

8) What are Stubs and when we use them?
    - Stubs generate prefdefined output (canned data)
    - Programmed Stubs return a success, failure or exception (as coded)
    - We use these return values to check whether the code behaves properly

9) What are Fakes and when we use them?
    - Fakes are almost working implementation of ex. DataBase (local impl)
    - When testing HTTP API we would create a Fakde local server
    - Testing receival of 10000 records:
        - Connect to a in memory DB that is created specifically for this test
        - Verify how the code behaves when it really gets lots of data
