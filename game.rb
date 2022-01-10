require_relative "player"
class Game
  def initialize()
    @question_turn = Player.new(1)
    @answer_turn = Player.new(2)
    @num1
    @num2
  end

  attr_reader :num1, :num2

  def question_turn_name
    @question_turn.name
  end

  def answer_turn_name
    @answer_turn.name
  end

  def get_scores()
    if @question_turn.id == 1
      return @question_turn.lives, @answer_turn.lives 
    else
      return @answer_turn.lives, @question_turn.lives
    end
  end

  def is_answer_correct(ans)
    if ans != @num1 + @num2
      @answer_turn.lives -= 1;
      return false
    end
    return true
  end

  def is_game_over()
    if @question_turn.lives == 0 || @answer_turn.lives == 0
      return true
    end
    return false
  end 

  def get_winner()
    if @question_turn.lives == 0
      return @answer_turn.name, @answer_turn.lives
    end
    return @question_turn.name, @question_turn.lives
  end

  def initiate_turn()
    @num1 = rand(10)
    @num2 = rand(10)
    # puts @num1, @num2
  end

  def end_turn()
    @question_turn, @answer_turn = @answer_turn, @question_turn
  end
end
