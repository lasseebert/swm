module Swm
  class Command
    def self.register(name, klass)
      registered_commands[name] = klass
    end

    def self.registered_commands
      @registered_commands ||= {}
    end
  end
end
