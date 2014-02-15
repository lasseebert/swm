module Swm
  class CliOptions < Hash

    def initialize(args)
      merge!(parse_options(args))
    end

    private

    def parse_options(args)
      pairs = args.each_slice(2)
      pairs = pairs.map { |pair| parse_pair(pair) }
      Hash[pairs]
    end

    def parse_pair(pair)
      raise "Misplaced option value: #{pair[0]}" unless pair[0].start_with?('--')
      raise "No option value for #{pair[0]}" if pair.length == 1
      raise "Misplaced option key: #{pair[1]}" if pair[1].start_with?('--')
      [pair[0].sub(/^--/, '').to_sym, decode_value(pair[1])]
    end

    def decode_value(arg)
      if arg =~ /\d+/
        arg.to_i
      else
        arg
      end
    end


  end
end
