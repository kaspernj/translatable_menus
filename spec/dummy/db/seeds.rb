Dummy::Application.eager_load!

user = User.find_or_initialize_by(
  :email => "admin@example.com"
)
user.password = "password"
user.save!
