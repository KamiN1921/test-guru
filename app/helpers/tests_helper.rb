module TestsHelper
  def test_header(test)
    test.new_record? ? t('helpers.new') : t('helpers.edit')
  end
end
