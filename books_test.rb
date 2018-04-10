require "minitest/autorun"

class BooksTest < Minitest::Test
  def setup
    @result = File.read("result_example.file")
  end

  def test_isbn
    assert_presence_of(/isbn/)
  end

  def test_title
    assert_presence_of(/title/)
  end

  def test_authors
    assert_presence_of(/"authors": ?\[\s*"Joe Blow",\s*"John Doe"\s*\]/m)
  end

  def test_weight
    assert_presence_of(/weight/)
    assert_presence_of(/"unit": ?2.34/)
    assert_presence_of(/"box": ?0.56/)
    assert_presence_of(/"shipping": ?2.9/)
    assert_presence_of(/"gross": ?3.78/)
  end

  def test_copyright
    assert_presence_of(/copyright/)
    assert_presence_of(/1981/, 2)
  end

  def test_pages
    assert_presence_of(/pages/)
    assert_presence_of(/112/)
  end

  def test_in_stock
    assert_presence_of(/in_stock/)
    assert_presence_of(/1635/)
  end

  private

    def assert_presence_of(pattern, expected_count = 1)
      assert_equal(expected_count, @result.scan(pattern).size)
    end
end
