
def hello_world
    # #1
    ARGV.each do |arg|
        puts "Hello, #{arg}!"
    end
end

hello_world