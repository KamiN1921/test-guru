# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

users = User.create([{ email: 'Vasya768@mail.ru', password: '123newpass', password_confirmation: '123newpass' },
                     { email: 'test@test.ui', password: '123123newpass', password_confirmation: '123123newpass' }])
categories = Category.create([{ title: 'General' }, { title: 'Programming' }, { title: 'Database' }])
tests = Test.create([{ title: 'HTML', category_id: categories.first.id, author_id: users.last.id },
                     { title: 'Ruby', level: '1', category_id: categories.last.id, author_id: users.last.id }])
questions = Question.create([{ body: 'First', test_id: tests.first.id }, { body: 'Second', test_id: tests.last.id }])
Admin.create({ email: 'admin@admin.com', password: '123123admin', password_confirmation: '123123admin' })
Answer.create([{ body: 'Yes', question_id: questions.first.id },
               { body: 'No', correct: true, question_id: questions.last.id }])
Result.create([{ user_id: users.first.id, test_id: tests.first.id },
               { user_id: users.last.id, test_id: tests.first.id }, { user_id: users.first.id, test_id: tests.last.id }])
