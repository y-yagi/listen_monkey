module ListenMonkey
  module Options
    def initialize(opts, defaults)
      @options = {}
      given_options = opts.dup
      defaults.keys.each do |key|
        @options[key] = if given_options.key?(key)
          given_options.delete(key)
        else
          defaults[key]
        end
      end

      return if given_options.empty?

      msg = "Unknown options: #{given_options.inspect}"
      Listen::Logger.warn msg
      fail msg
    end
  end
end
