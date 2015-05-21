require_relative '../test_helper'

class UserDeleteRobotTest < FeatureTest

  def test_edit_task
    RobotWorld.create({:name => "Frank"})

    visit '/robots'
    assert page.has_content?("Frank")
    click_on 'Deactivate'
    refute page.has_content?("Frank")
  end
end
