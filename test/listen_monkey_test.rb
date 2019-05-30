require "test_helper"

class ListenMonkeyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ListenMonkey::VERSION
  end
end
