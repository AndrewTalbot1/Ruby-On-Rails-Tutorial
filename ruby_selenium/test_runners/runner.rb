require_relative"../Test/first_ruby_selenium_test.rb"

#
# Method for test runner
#
def regression_suite
  #
  # Add Class Instantiation Here
  #
  test_one = Test_One.new # Simple Mockup - change accordingly 

  #
  # Add the tests you want from your Test folder here
  #
  test_one.test_1
  test_one.test_2
end