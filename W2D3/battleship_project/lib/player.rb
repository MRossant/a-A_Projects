class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        response = gets.chomp.split(" ")
        nums = response.map(&:to_i)
        [nums[0], nums[1]]
    end
end
