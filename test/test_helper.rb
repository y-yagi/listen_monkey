$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "listen"
require "listen_monkey"

require "minitest/retry"
Minitest::Retry.use!

require "minitest/autorun"
