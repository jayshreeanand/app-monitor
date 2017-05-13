require 'sentimental'

class SentimentUtils
  attr_accessor :analyzer

  def initialize
    @analyzer = Sentimental.new
    @analyzer.load_defaults
    @analyzer.threshold = 0.1
  end
  
  def find_sentiment(text)

  end
end
