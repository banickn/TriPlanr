module GoalsHelper
    def priorityIcon priority
        if priority == "A"
            "<div class=\"timeline-icon bg-secondary\">".html_safe
        elsif priority == "B"
            "<div class=\"timeline-icon bg-warning\">".html_safe
        elsif priority == "C"
            "<div class=\"timeline-icon bg-info\">".html_safe
        else
            "<div class=\"timeline-icon bg-success\">".html_safe
        end
    end
end
