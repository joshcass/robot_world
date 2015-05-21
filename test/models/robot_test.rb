require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
      data = { :name       => "Frank",
               :department => "the bossman",
               :city       => "lansing",
               :state      => "michigan",
               :birthdate  => "10/10/10",
               :date_hired => "10/10/15",
               :avatar     => "http://www.avatar.com",
               :feeling    => "nervous",
               :id         => 1 }

      robot = Robot.new(data)

      assert_equal "Frank", robot.name
      assert_equal "the bossman", robot.department
      assert_equal "lansing", robot.city
      assert_equal "michigan", robot.state
      assert_equal "10/10/10", robot.birthdate
      assert_equal "10/10/15", robot.date_hired
      assert_equal "http://www.avatar.com", robot.avatar
      assert_equal 1, robot.id
  end
end
