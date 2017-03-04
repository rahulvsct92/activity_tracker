if User.manager.blank?
	manager = User.new(name: "test", email: "test@example.com", password: "testpassword", role: "manager")
	manager.save(validate: false)
end