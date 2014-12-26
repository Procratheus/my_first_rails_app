module TestFactories

  def associated_post(options={})
    post_options = {
      user: authenticated_user,
      topic: Topic.create(name: "Topic name"),
      title: "post title",
      body: "post bodies must be pretty long"
      }.merge(options)
      Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {
      email: "email#{rand}@fake.com",
      password: "password"
      }.merge(options)
      user = User.new(user_options)
      user.skip_confirmation!
      user.save
      user
  end

  FactoryGirl.define do
    factory :user do
      email "test@example.com"
      password "password"
    end
  end

end
