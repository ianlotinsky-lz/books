require "test/unit"

class BookTest < Test::Unit::TestCase
  def setup
    @result = File.open('result_example.file', 'rb').read
  end

  def test_isbn
    assert_equal ["isbn"], @result.scan(/isbn/)
  end

  def test_title
    assert_equal ["title"], @result.scan(/title/)
  end

  def test_authors
    assert_equal 1, @result.scan(/"authors": \["Joe Blow", "John Doe"\]/).size
  end

  def test_weight
    assert_equal ["weight"], @result.scan(/weight/)
    assert_equal ["unit"], @result.scan(/unit/)
    assert_equal ["box"], @result.scan(/box/)
    assert_equal ["shipping"], @result.scan(/shipping/)
  end

  def test_copyright
    assert_equal ["copyright"], @result.scan(/copyright/)
    assert_equal ["1981", "1981"], @result.scan(/1981/)
  end

  def test_pages
    assert_equal ["pages"], @result.scan(/pages/)
    assert_equal ["112"], @result.scan(/112/)
  end

  def test_in_stock
    assert_equal ["in_stock"], @result.scan(/in_stock/)
    assert_equal ["1635"], @result.scan(/1635/)
  end
end
