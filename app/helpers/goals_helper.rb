module GoalsHelper
    def priorityColour priority
        if priority == "A"
            "prioA"
        elsif priority == "B"
            "prioB"
        elsif priority == "C"
            "prioC"
        else
            "prioC"
        end
    end
end
