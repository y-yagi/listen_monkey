require "test_helper"
require "tmpdir"
require "fileutils"

class ListenMonkey::Adapter::LinuxTest < Minitest::Test
  def setup
    @tmpdir = Dir.mktmpdir("listen_monkey")
    FileUtils.mkdir_p("#{@tmpdir}/child")
  end

  def teardown
    FileUtils.rm_rf(@tmpdir)
  end

  def test_listen_to
    @counter = 0
    Listen.to(@tmpdir) { @counter += 1 }.start

    FileUtils.touch("#{@tmpdir}/file1")
    wait

    FileUtils.touch("#{@tmpdir}/child/file1")
    wait

    assert_equal 2, @counter
  end

  def test_listen_to_with_recursive_option
    @counter = 0
    Listen.to(@tmpdir, recursive: false) { @counter += 1 }.start

    FileUtils.touch("#{@tmpdir}/file1")
    wait

    FileUtils.touch("#{@tmpdir}/child/file1")
    wait

    assert_equal 1, @counter
  end

  private

  def wait
    sleep 1
  end
end
