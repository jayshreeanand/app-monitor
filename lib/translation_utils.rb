require 'easy_translate'

module TranslationUtils
  def self.translate(text)
    begin
      EasyTranslate.api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
      lang = EasyTranslate.detect(text)
      if lang != 'en'
        EasyTranslate.translate(text, from: lang, to: :en)
      else
        text
      end
    rescue EasyTranslate::EasyTranslateException => e
      return text
    end
  end
end