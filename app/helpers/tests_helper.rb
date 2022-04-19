module TestsHelper
  def test_header(test)
    test.new_record? ? 'New' : 'Edit'
  end
end
