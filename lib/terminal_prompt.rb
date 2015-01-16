class TerminalPrompt
    @@reserved = [ :help, :exit ]

    def initialize(commands = {})
        @@reserved.each do |command|
            commands[command] = method(command).to_proc
        end

        @commands = commands
        @is_first_prompt = true
    end

    def command(key, &block)
        key_symbol = key.to_sym

        if !@@reserved.include?(key_symbol)
            @commands[key_symbol] = block
        end
    end

    def loop
        selection = nil
        while selection != :exit
            if @commands.has_key?(selection)
                @commands[selection].call()
            end

            selection = prompt
        end
    end

    def prompt
        if @is_first_prompt
            @is_first_prompt = false
            help
        end

        print "> "
        selection = gets.chomp
        puts ""

        return selection.to_sym
    end

    def help
        command_strings = @commands.keys.map {|key| "[#{key}]"}
        puts "Select one of #{command_strings.join(" ")}"
    end

    def exit
    end
end
