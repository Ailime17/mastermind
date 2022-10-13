class Mastermind
    @@all_colors = ['p','br','o','g','b','y']
    def initialize
      @computer = @@all_colors.shuffle.first(4)
      p @computer
      puts "Welcome to Mastermind game. Here are the rules: \n~The computer picks 4 out of 6 different colors. Each color is positioned in a specific place in a row \n~Your task is to guess which colors were picked by the computer and what is their sequence. \n~Your guess should look like this: \ng p y b     -> where g stands for green, p = pink, y = yellow, b = blue \n~Available colors are: g (green), o (orange), br (brown),  p (pink), y (yellow), b (blue) \n~You have 12 guesses \nPress enter to start game"
    gets
    puts "Computer: <?, ?, ?, ?>"
    round
    end
    def round
      12.times do
        puts "Please type your guess (e.g. g p y b):"
        @guess = gets.strip.split
        until @guess.length == 4
          puts "Please type your guess like this (pick 4 colors from the available 6 colors): \ng p y b"
          @guess = gets.strip.split
        end
        if @computer == @guess
            puts "Congratulations! You've guessed correctly"
            break
        end
        @correct_colors = 0
        @correct_placements = 0
        @guess.each do |user_color|
          if @computer.include?(user_color)
            @correct_colors += 1
          end
          if @guess.index(user_color) == @computer.index(user_color)
            @correct_placements += 1
          end
        end
        puts "You've guessed correctly #{@correct_colors} colors! #{@correct_placements} of those colors were in the right place!"
      end
      puts "End Game"
      puts "Computer's colors were: <#{@computer.join(", ")}>"
    end
  end
  new = Mastermind.new