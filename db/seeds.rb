# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  User.create([{ login: "Vasya" }, { login: "Oleg" }])
  Category.create([{title: "General"},{title: "Programming"}, {title:"Database"}])
  Test.create([{title: "HTML", category_id:"1"},{title:"Ruby", level: "1", category_id:"2"}])
  Question.create([{body: "First", test_id:"1"},{body: "Second", test_id: "2"}])
  Answer.create([{body:"Yes",question_id:"1"},{body:"No", correct: false, question_id: "1"}])
  Result.create([{user_id:"1", test_id:"1" }, {user_id:"1", test_id:"2" }, {user_id:"1", test_id:"3" }])
