require "listen/adapter"
require "listen_monkey/adapter/linux"

module Listen
  module Adapter
    class << self
      private

      def _usable_adapter_class
        adapter = Listen::Adapter::OPTIMIZED_ADAPTERS.detect(&:usable?)
        adapter = ListenMonkey::Adapter::Linux if adapter == Listen::Adapter::Linux
        adapter
      end
    end
  end
end
