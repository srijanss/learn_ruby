class Timer
    #write your code here
    attr_accessor :seconds

    def initialize
        @seconds = 0
    end

    def time_string
        hour = 0
        minute = 0
        second = @seconds
        formatted_time = ""
        while second > 60 do
            second -= 60
            minute += 1
            if minute >= 60
                minute = 0
                hour += 1
            end
        end
        hour = format_time(hour)
        minute = format_time(minute)
        second = format_time(second)
        formatted_time = hour + ":" + minute + ":" + second
    end

    def format_time(time)
        if time.to_s.length < 2
            time =  "0" + time.to_s
        else
            time = time.to_s
        end
        time
    end
end
