require 'application_system_test_case'

class AnswersTest < ApplicationSystemTestCase
  setup do
    @answer = answers(:one)
  end

  test 'visiting the index' do
    visit answers_url
    assert_selector 'h1', text: 'answers'
  end

  test 'should create answer' do
    visit answers_url
    click_on 'New answer'

    click_on 'Create answer'

    assert_text 'answer was successfully created'
    click_on 'Back'
  end

  test 'should update answer' do
    visit answer_url(@answer)
    click_on 'Edit this answer', match: :first

    click_on 'Update answer'

    assert_text 'answer was successfully updated'
    click_on 'Back'
  end

  test 'should destroy answer' do
    visit answer_url(@answer)
    click_on 'Destroy this answer', match: :first

    assert_text 'answer was successfully destroyed'
  end
end
