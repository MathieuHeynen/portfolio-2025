module WorksHelper
  def to_binary_string(text)
    first_word = text.split.first
    first_word.chars.map { |c| c.ord.to_s(2).rjust(8, '0') }.join
  end
end
