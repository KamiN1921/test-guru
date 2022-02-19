# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  users = User.create([{ login: "Vasya" }, { login: "Oleg" }])
  categories = Category.create([{title: "General"},{title: "Programming"}, {title:"Database"}])
  tests = Test.create([{title: "HTML", category_id: categories.first.id, author_id: users.last.id },{title:"Ruby", level: "1", category_id:categories.last.id, author_id:users.last.id}])
  questions = Question.create([{body: "First", test_id: tests.first.id},{body: "Second", test_id: tests.last.id}])
  Answer.create([{body:"Yes",question_id:questions.first.id},{body:"No", correct: false, question_id: questions.last.id}])
  Result.create([{users_id:users.first.id, tests_id:tests.first.id }, {users_id:users.last.id, tests_id:tests.first.id }, {users_id:users.first.id, tests_id:tests.last.id }])
