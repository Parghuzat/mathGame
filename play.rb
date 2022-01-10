require_relative "game"

class Play
  def initialize()
    @game = Game.new()
  end

  def print_new_turn
    puts "----- NEW TURN -----"
  end

  def print_question
    puts "#{@game.question_turn_name()}: What does #{@game.num1} plus #{@game.num2} equal?"
  end

  def print_correct
    puts "#{@game.question_turn_name()}: YES! You are correct."
  end

  def print_incorrect
    puts "#{@game.question_turn_name()}: Seriously? No!"
  end

  def print_game_over
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end

  def print_score()
    scores = @game.get_scores()
    puts "P1: #{scores[0]}/3 vs P2 #{scores[1]}/3"
  end
  
  def print_winner(name, score)
    puts "#{name} wins with a score of #{score}/3"
  end
    

  def start_play()
    puts "----- START -----"
    while !@game.is_game_over
      @game.initiate_turn()
      print_new_turn
      print_question
      ans = gets.chomp.to_i
      if @game.is_answer_correct(ans)
        print_correct()
      else
        print_incorrect()
      end
      print_score()
      @game.end_turn()
    end 
    winner = @game.get_winner()
    print_winner(winner[0], winner[1])
    print_game_over
  end

end