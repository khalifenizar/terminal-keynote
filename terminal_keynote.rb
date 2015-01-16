require_relative "lib/terminal_prompt"

prompt = TerminalPrompt.new

prompt.command("next") do
    puts "You selected the next slide!"
end

prompt.command("prev") do
    puts "You selected the previous slide!"
end

puts ""
prompt.loop
