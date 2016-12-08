module PeriodizationYearsHelper
    def deltaCTL(cycle, sport)
        if cycle.start_with?("load") == TRUE
            if sport == "Bike"
                $perBikeRamp.to_i
            elsif sport == "Run"
                $perRunRamp.to_i
            else
                $perSwimRamp.to_i
            end
        else
            if sport == "Bike"
                -$bikeCTLRamp.to_i
            elsif sport == "Run"
                -$runCTLRamp.to_i
            else
                -$swimCTLRamp.to_i
            end
        end
    end
end
