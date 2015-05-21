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
    @id         = data[:id]
    @name       = data[:name] || Faker::Name.name
    @city       = data[:city] || Faker::Address.city
    @state      = data[:state] || Faker::Address.state
    @birthdate  = data[:birthdate] || Faker::Date.birthday(1, 1000)
    @date_hired = data[:date_hired]|| Faker::Date.backward(700)
    @department = data[:department] || Faker::Lorem.sentence
    @avatar     = data[:avatar] || Faker::Avatar.image("bob_bot", "50x50")
    @feeling    = data[:feeling] || Faker::Lorem.word
  end
end
