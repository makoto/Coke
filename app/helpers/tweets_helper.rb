module TweetsHelper
  def highlight(text)
    text = text.gsub(/(coke)/i,'<mark>\1</mark>')
    text = text.gsub(/(coca-cola)/i,'<mark>\1</mark>')
    text = text.gsub(/(diet cola)/i,'<mark>\1</mark>')
  end
end
