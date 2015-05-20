require 'yaml/store'
require_relative 'robot'

class RobotWorld
  def self.database
    @database ||= YAML::Store.new("db/task_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id"          => database['total'],
                              "name"        => robot[:@name],
                              "city"        => robot[:@city],
                              "state"       => robot[:@state],
                              "birthdate"   => robot[:@birthdate],
                              "date_hired"  => robot[:@date_hired],
                              "departement" => robot[:@department],
                              "avatar"      => robot[:@avatar]
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
      target["name"]       = data[:@name]
      target["city"]       = data[:@city]
      target["state"]      = data[:@state]
      target["birthdate"]  = data[:@birthdate]
      target["date_hired"] = data[:@date_hired]
      target["department"] = data[:@department]
      target["avatar"]     = data[:@avatar]
    end
  end

  def self.delete(id)
   database.transaction do
     database['robots'].delete_if { |robot| robot['id'] == id }
   end
  end
end
