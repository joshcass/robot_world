require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def robot_world_for(*hashes)
    hashes.each {|data| RobotWorld.create(data)}
  end

  def test_can_create_a_robot
    robot_world_for({ :name       => "Frank",
                      :department => "Dungeon Economics" })
    robot_id = RobotWorld.all.last.id
    robot = RobotWorld.find(robot_id)
    assert_equal "Frank", robot.name
    assert_equal "Dungeon Economics", robot.department
    assert_equal robot_id, robot.id
  end

  def test_can_return_all_robots
    robot_world_for({:name       => "Frank"},
                    {:name       => "Bob"})

    assert_equal 2, RobotWorld.all.count
    assert_equal ["Frank", "Bob"], RobotWorld.all.map(&:name)
  end

  def test_it_can_find_a_robot
    robot_world_for({:name       => "Frank"},
                    {:name       => "Bob"},
                    {:name       => "Sam",
                     :department => "Dungeon Economics"})
    robot_id = RobotWorld.all.last.id
    robot = RobotWorld.find(robot_id)

    assert_equal "Sam", robot.name
    assert_equal "Dungeon Economics", robot.department
    assert_equal robot_id, robot.id
  end

  def test_it_can_update_a_robot
    robot_world_for({ :name       => "Bob",
                      :department => "Dungeon Economics"})
    update_data = {:name       => "Frank",
                   :department => "Dungeon Recipes"}
    robot_id = RobotWorld.all.last.id
    robot = RobotWorld.find(robot_id)

    assert_equal "Bob", robot.name
    assert_equal "Dungeon Economics", robot.department
    assert_equal robot_id, robot.id

    RobotWorld.update(robot_id, update_data)
    robot_update = RobotWorld.find(robot_id)

    assert_equal "Frank", robot_update.name
    assert_equal "Dungeon Recipes", robot_update.department
    assert_equal robot_id, robot_update.id
  end

  def test_it_can_delete_a_robot
    robot_world_for({:name       => "Frank"},
                    {:name       => "Bob"},
                    {:name       => "Sam"})
    robot_id = RobotWorld.all.last.id
    assert_equal 3, RobotWorld.all.count
    RobotWorld.destroy(robot_id)
    assert_equal 2, RobotWorld.all.count
  end
end
