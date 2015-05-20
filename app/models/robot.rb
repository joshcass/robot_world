class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthdate,
              :date_hired,
              :department,
              :avatar,
              :feeling

  def initialize(data)
    @id         = data["id"]
    @name       = data["name"]
    @city       = data["city"]
    @state      = data["state"]
    @birthdate  = data["birthdate"]
    @date_hired = data["date_hired"]
    @department = data["department"]
    @avatar     = data["avatar"]
    @feeling    = data["feeling"]
  end
end
