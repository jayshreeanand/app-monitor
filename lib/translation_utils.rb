require 'easy_translate'

module TranslationUtils
  def self.translate(text)
    EasyTranslate.api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
    lang = EasyTranslate.detect(text)
    if lang != 'en'
      EasyTranslate.translate(text, from: lang, to: :en)
    else
      text
    end
  end
end