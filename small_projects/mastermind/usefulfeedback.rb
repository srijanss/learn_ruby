module UsefulFeedback
    COLORS = ['WHITE', 'BLACK', 'GREEN', 'RED', 'BLUE', 'YELLOW', 'PURPLE', 'ORANGE', 'BROWN']

    def feedback(status)
        if status == 1
           feedback_text = "You Guessed the right color but in wrong position"
        elsif status == 0
            feedback_text = "You Guessed the right color"
        else
            feedback_text = "Sorry you Guessed the wrong color"
        end
        feedback_text
    end
end
