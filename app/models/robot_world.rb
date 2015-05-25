class RobotWorld
  def self.database
    if ENV["ROBOT_WORLD_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_dev.sqlite3")
    end
  end

  def self.create(robot)
    dataset.insert robot
  end

  def self.all
    dataset.map { |data| Robot.new data }
  end

  def self.find(id)
    robot = dataset.where(:id => id)
    Robot.new(robot.to_a.first)
  end

  def self.update(id, data)
   dataset.where(:id => id).update data
  end

  def self.destroy(id)
    dataset.where(:id => id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from :robots
  end

  def self.signup(user)
  end
end
