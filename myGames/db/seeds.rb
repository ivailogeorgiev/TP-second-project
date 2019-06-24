5.times do
	Game.create({
		title: Faker::Book.title,
		body: Faker::Lorem.sentence
	})
end