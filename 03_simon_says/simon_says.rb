#write your code here
def echo(talk)
    talk
end

def shout(talk)
    talk.upcase
end

def repeat(talk, count=2)
    ((talk + " ") * count).strip
end

def start_of_word(talk, position)
    talk[0..position-1]
end

def first_word(talk)
    talk.split[0]
end

def titleize(talk)
    conjunctions = ['and', 'or']
    prepositions = ['over']
    articles = ['a', 'an', 'the']
    temp = ""
    titelize_talk = ""
    word_count = 0
    talk.split.each do |word|
        temp = titelize_talk
        if word_count != 0 and (conjunctions.include? word or prepositions.include? word or articles.include? word) 
            titelize_talk = word
        else
            titelize_talk = word.sub(word[0], word[0].upcase)
        end
        word_count += 1
        titelize_talk = temp +  titelize_talk + " "
    end
    titelize_talk.strip
end
