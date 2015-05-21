require 'yaml/store'

class RobotWorld
  def self.database
    if ENV["ROBOT_WORLD_ENV"] == "test"
      @database ||= YAML::Store.new("db/robot_world_test")
    else
      @database ||= YAML::Store.new("db/robot_world")
    end
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id"          => database['total'],
                              "name"        => robot[:name],
                              "city"        => robot[:city],
                              "state"       => robot[:state],
                              "birthdate"   => robot[:birthdate],
                              "date_hired"  => robot[:date_hired],
                              "department" => robot[:department],
                              "avatar"      => robot[:avatar],
                              "feeling"     => robot[:feeling]
                              }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find { |robot| robot["id"] == id }
      target["name"]       = data[:name]
      target["city"]       = data[:city]
      target["state"]      = data[:state]
      target["birthdate"]  = data[:birthdate]
      target["date_hired"] = data[:date_hired]
      target["department"] = data[:department]
      target["avatar"]     = data[:avatar]
      target["feeling"]    = data[:feeling]
    end
  end

  def self.destroy(id)
   database.transaction do
     database['robots'].delete_if { |robot| robot['id'] == id }
   end
  end

  def self.delete_all
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end
end
