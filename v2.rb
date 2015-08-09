class Archive
  def initialize doc
    @@file_data = {}
    file= File.open(doc, 'r')
      file.each_line do |line|
        line_data = line.split(',')
         @@file_data[line_data[0]] = line_data[1]
      end
  end
  def extracting_question
     questions=[]
     @@file_data.each_key {|key| questions << key}
     questions
  end
  def extracting_answer
     answers=[]
     @@file_data.each_value {|value| answers << value}
     answers.map {|x| x.strip!}
  end
end

class Game
  def initialize (a,b)
    @questions=a
    @answers=b
  end

  def play
    puts "Bienvenido, ingresa la traducción correcta"
    puts '¿Preparado?, presiona enter'
    gets.chomp
    @i=0
    while @i <= @questions.length-1
    asking
    get_answers
      while @ans != @answers[@i]
      puts "Inténtalo de nuevo"
      get_answers
      end
    @i+=1
    end
    puts '¡Muy bien!'
  end

  private

  def asking
    puts "¿Equivalencia de #{@questions[@i]}?"
  end

  def get_answers
    @ans = gets.chomp.downcase
  end
end

questionnaire = Archive.new('palabras.txt')
a=questionnaire.extracting_question
#print a
#puts ''
b=questionnaire.extracting_answer
#print b
game=Game.new(a,b)
game.play
