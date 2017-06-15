# Caesar cipher

def caesar_cipher(text, shift)
  result_text = ""
  text.scan(/./) do |l|
    if l.ord >=65 && l.ord <=90 
      result_text += handle_shift(l, shift, 90)
    elsif l.ord >=97 && l.ord <=122 
      result_text += handle_shift(l, shift, 122)
    else
      result_text += l
    end
  end
  result_text
end

def handle_shift(l, shift, end_ascii)
  if l.ord + shift > end_ascii # checking end cases 
    result_text = (l.ord + shift - 26).chr
  else
    result_text = (l.ord + shift).chr
  end
  result_text
end

puts caesar_cipher("This is a caesar cipher Wow XyZ", 5)
# puts caesar_cipher("Ymnx nx f hfjxfw hnumjw Btb CdE", -5)