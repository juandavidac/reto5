class Archive

   attr_accessor :questions, :answers

  def initialize
    @file_data = {}
    file= File.open('palabras.txt', 'r')
      file.each_line do |line|
        line_data = line.split(',')
         @file_data[line_data[0]] = line_data[1]
      end
      
      @questions=[]
      @file_data.each_key {|key|  @questions << key}
   
      @answers=[]
      @file_data.each_value {|value|  @answers << value}
      @answers.map {|x| x.strip!}
  end
end

class Game

  def initialize
    @questions=Archive.new.questions
    @answers=Archive.new.answers
  end

  def play
    puts "Bienvenido, ingresa la traducción correcta"
    puts '¿Preparado?, presiona enter'
    gets.chomp
    @i=0
    while @i <= @questions.length-1
    ask_answer
      while @ans != @answers[@i]
      puts "Inténtalo de nuevo"
      ask_answer
      end
    @i+=1
    end
    puts '¡Muy bien!'
  end

  def ask_answer
    puts "¿Equivalencia de #{@questions[@i]}?"
    @ans = gets.chomp.downcase
  end

end

game=Game.new
game.play
