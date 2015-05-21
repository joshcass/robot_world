require_relative '../test_helper'

class UserEditRobotTest < FeatureTest

  def test_edit_robot
    RobotWorld.create({:department => "Dungeon Economics"})

    visit '/robots/1'
    assert page.has_content?("Dungeon Economics")
    visit '/robots'
    click_on 'Edit'
    fill_in 'robot[department]', with: "Dungeon Recipes"
    click_on 'Update Robot'
    assert page.has_content?("Dungeon Recipes")
    refute page.has_content?("Dungeon Economics")
  end
end
