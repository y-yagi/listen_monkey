require "listen/adapter/linux"

module ListenMonkey
  module Adapter
    class Linux < Listen::Adapter::Linux
      DEFAULTS = {
        events: [
          :recursive,
          :attrib,
          :create,
          :delete,
          :move,
          :close_write
        ],
        wait_for_delay: 0.1,
        recursive: true,
      }.freeze

      private

      def _configure(directory, &callback)
        require 'rb-inotify'
        @worker ||= ::INotify::Notifier.new
        events = options.events
        events.delete(:recursive) unless options.recursive
        @worker.watch(directory.to_s, *events, &callback)
      rescue Errno::ENOSPC
        abort(INOTIFY_LIMIT_MESSAGE)
      end
    end
  end
end
