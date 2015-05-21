require_relative '../test_helper'

class UserCreatesRobotTest < FeatureTest
  def test_creating_a_robot
    visit '/robots/new'
    fill_in 'robot[name]', with: 'Frank'
    click_on "Activate"

    within('#robot') do
      assert page.has_content?("Frank")
    end
  end
end
