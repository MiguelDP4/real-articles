module ArticlesHelper
  def text_reductor(text,max_length)
    if text.length > max_length
      text = text[0..max_length] + "..."
    else
      text[0..max_length]
    end
  end
end
