module WorkoutsHelper
    def floatToTime(input)
        minutes = input % 60
        hours = input / 60
        format("%02d:%02dh", hours, minutes)
    end
end
