class Book
    # write your code here
    attr_accessor :title

    def title 
        # @title.sub(@title[0], @title[0].upcase) 
        conjunctions = ['and', 'or']
        prepositions = ['in', 'of', 'over']
        articles = ['a', 'an', 'the']
        titelize_title = ""
        word_count = 0
        @title.split.each do |word|
            temp = titelize_title
            if word_count != 0 and (conjunctions.include? word or prepositions.include? word or articles.include? word) 
                titelize_title = word
            else
                titelize_title = word.sub(word[0], word[0].upcase)
            end
            word_count += 1
            titelize_title = temp +  titelize_title + " "
        end
        @title = titelize_title.strip
    end
end
