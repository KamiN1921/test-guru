# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  User.create([{ login: "Vasya" }, { login: "Oleg" }])
  Category.create([{title: "General"},{title: "Programming"}, {title:"Database"}])
  Test.create([{title: "HTML", category_id: Category.first.id},{title:"Ruby", level: "1", category_id:Category.last.id}])
  Question.create([{body: "First", test_id:Test.first.id},{body: "Second", test_id: Test.last.id}])
  Answer.create([{body:"Yes",question_id:Question.first.id},{body:"No", correct: false, question_id: Question.last.id}])
  Result.create([{user_id:User.first.id, test_id:Test.first.id }, {user_id:User.last.id, test_id:Test.first.id }, {user_id:User.first.id, test_id:Test.last.id }])
