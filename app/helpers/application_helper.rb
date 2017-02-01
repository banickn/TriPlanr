module ApplicationHelper
    def runSpeedOptionFormHelper n
        $minSpeed = 180
        $speed = $minSpeed + n * 5
        seconds = $speed % 60
        minutes = $speed / 60
        output = format("%02d:%02d min/km", minutes, seconds)
        "<option value=\"#{$speed}\">#{output}</option>".html_safe
    end
end
