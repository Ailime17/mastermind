class ReversedMastermind
    @@all_colors = ['p','br','o','g','b','y']
    def initialize
      puts "Great choice! Here are the rules: \n~Your task is to pick 4 out of 6 different colors. Each color is positioned in a specific place in a row \n~The computer has to guess which colors you picked and what is their sequence. \n~Your choice should look like this: \ng p y b     -> where g stands for green, p = pink, y = yellow, b = blue \n~Available colors are: g (green), o (orange), br (brown),  p (pink), y (yellow), b (blue) \n~The computer has 12 guesses \nPress enter to start game"
      gets
      round
    end
    def round
      puts "Enter your secret sequence of colors: "
      @choice = gets.strip.split
      until (@choice.length == 4 && @@all_colors.include?(@choice[0]) && @@all_colors.include?(@choice[1]) && @@all_colors.include?(@choice[2]) && @@all_colors.include?(@choice[3]))
          puts "Please type your choice like this (pick 4 colors from the available 6 colors): \ng p y b"
          @choice = gets.strip.split
      end
      @comp = Array.new(4, '0')
      12.times do
        @computer = @@all_colors.shuffle.first(4)
        @computer = @comp unless @comp.include?('0')
        @correct_colors = 0
        @correct_placements = 0
        if @computer == @choice
            puts "Computer's colors: <#{@computer.join(", ")}>"
            puts "You lost! Computer guessed correctly"
            @correct_placements = 4
            break
        end
        @choice.each do |user_color|
          if @computer.include?(user_color)
            @correct_colors += 1
          end
          if @choice.index(user_color) == @computer.index(user_color)
            @correct_placements += 1
       @comp.insert((@computer.index(user_color)+1),user_color)
       @comp.delete_at(@computer.index(user_color))
          end
        end
        puts "Computer's colors: <#{@computer.join(", ")}>"
        puts "Computer guessed correctly #{@correct_colors} colors! #{@correct_placements} of those colors were in the right place!"
      end
      puts @correct_placements == 4 ? "End Game" : "End Game. You won! Computer didn't guess correctly!"
    end
  end
  
  class Mastermind
    @@all_colors = ['p','br','o','g','b','y']
    def initialize
      @computer = @@all_colors.shuffle.first(4)
      puts "Welcome to Mastermind game. Do you want to be the codemaker or the codebreaker? Press 1 for codemaker, 2 for codebreaker:"
      answer = gets.strip
      if answer == '2'
        puts "Great choice! Here are the rules: \n~The computer picks 4 out of 6 different colors. Each color is positioned in a specific place in a row \n~Your task is to guess which colors were picked by the computer and what is their sequence. \n~Your guess should look like this: \ng p y b     -> where g stands for green, p = pink, y = yellow, b = blue \n~Available colors are: g (green), o (orange), br (brown),  p (pink), y (yellow), b (blue) \n~You have 12 guesses \nPress enter to start game"
      gets
      puts "Computer: <?, ?, ?, ?>"
      round
      elsif answer == '1'
        ReversedMastermind.new
      end
    end
    def round
      12.times do
        puts "Please type your guess (e.g. g p y b):"
        @guess = gets.strip.split
        until (@guess.length == 4 && @@all_colors.include?(@guess[0]) && @@all_colors.include?(@guess[1]) && @@all_colors.include?(@guess[2]) && @@all_colors.include?(@guess[3]))
          puts "Please type your guess like this (pick 4 colors from the available 6 colors): \ng p y b"
          @guess = gets.strip.split
        end
        @correct_colors = 0
        @correct_placements = 0
        if @computer == @guess
            puts "Congratulations! You've guessed correctly"
            @correct_placements = 4
            break
        end
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
      puts @correct_placements == 4 ? "End Game" : "End Game. You lost!"
      puts "Computer's colors were: <#{@computer.join(", ")}>"
    end
  end
  Mastermind.new