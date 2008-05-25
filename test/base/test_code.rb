require 'helper'

class Nanoc::CodeTest < Test::Unit::TestCase

  def setup    ; global_setup    ; end
  def teardown ; global_teardown ; end

  def test_load
    # Initialize
    $complete_insane_parrot = 'meow'

    # Create code and load it
    code = Nanoc::Code.new("$complete_insane_parrot = 'woof'")
    code.load

    # Ensure code is loaded
    assert_equal('woof', $complete_insane_parrot)
  end

  def test_load_with_toplevel_binding
    # Initialize
    @foo = 'meow'

    # Create code and load it
    code = Nanoc::Code.new("@foo = 'woof'")
    code.load

    # Ensure binding is correct
    assert_equal('meow', @foo)
  end

end