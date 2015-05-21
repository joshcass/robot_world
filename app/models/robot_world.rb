require 'yaml/store'

class RobotWorld
  def self.database
    if ENV["ROBOT_WORLD_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_dev.sqlite3")
    end
  end

  def self.create(robot)
    dataset.insert(:name       => robot[:name],
                   :city       => robot[:city],
                   :state      => robot[:state],
                   :birthdate  => robot[:birthdate],
                   :date_hired => robot[:date_hired],
                   :department => robot[:department],
                   :avatar     => robot[:avatar],
                   :feeling    => robot[:feeling])
  end

  def self.all
    dataset.map do |data|
      Robot.new(data)
    end
  end

  def self.find(id)
    robot = dataset.where(:id => id)
    Robot.new(robot.to_a.first)
  end

  def self.update(id, data)
   dataset.where(:id => id).update(data)
  end

  def self.destroy(id)
    dataset.where(:id => id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:robots)
  end
end
