require_relative "config/application"
Application.finalize!

user_repo = App::Repos::UserRepo.new

res = user_repo.create_with_tasks({
  first_name: "FName",
  last_name: "LName",
  age: 50,
  created_at: Time.now,
  updated_at: Time.now,
  tasks: [
    {
      completed_at: Time.now,
      name: "Do this"
    },
    {
      name: "Not gonna do"
    }
  ]
})

puts res
