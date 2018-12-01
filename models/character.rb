class Character
  attr_accessor :name

  def initialize(name:)
    self.name = name
  end

  def speak(words_to_speak)
    puts words_to_speak
  end
end
