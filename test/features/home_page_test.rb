require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_it_has_a_greeting
   visit '/'
   within('#greeting') do
      assert page.has_content?("Welcome to the Wonderful World Of Robots")
    end
  end
end
