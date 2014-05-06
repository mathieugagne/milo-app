namespace :projects do

  task fake: :environment do
    STATUSES = Project.statuses.keys
    @user = User.first
    20.times do
      title = Faker::Address.state
      description = Faker::Lorem.paragraph
      status = STATUSES.at(Random.rand(0..3))
      Project.create(title: title, description: description, status: status) do |project|
        Random.rand(0..5).times { project.comments.new(text: Faker::Lorem.sentence, user: @user) }
      end
    end
  end
end