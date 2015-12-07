require "minitest/autorun"

class BooksTest < Minitest::Test 
  def setup
    @result = File.read("result_example.file")
  end

  def test_isbn
    assert_equal ["isbn"], @result.scan(/isbn/)
  end

  def test_title
    assert_equal ["title"], @result.scan(/title/)
  end

  def test_authors
    assert_equal 1, @result.scan(/"authors": \[\s*"Joe Blow",\s*"John Doe"\s*\]/m).size
  end

  def test_weight
    assert_equal ["weight"], @result.scan(/weight/)
    assert_equal [%Q("unit": 2.34)], @result.scan(/"unit": 2.34/)
    assert_equal [%Q("box": 0.56)], @result.scan(/"box": 0.56/)
    assert_equal [%Q("shipping": 2.9)], @result.scan(/"shipping": 2.9/)
    assert_equal [%Q("gross": 3.78)], @result.scan(/"gross": 3.78/)
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
