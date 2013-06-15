module Swm

  class CommandRunner
    def self.run(command, command_options = {}, global_options = {})
      command = get_command_class(command).new command_options, global_options
      command.run
    end

    def self.get_command_class(command)
      Swm.const_get "#{command.capitalize}Command"
    end
  end
end
