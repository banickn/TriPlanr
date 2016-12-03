class PeriodizationYear < ApplicationRecord
    has_many :periodization_cycles

    def calcATPValues()
        $i = 0
        @atpBike = Array.new
        @atpRun = Array.new
        @atpSwim = Array.new
        @atpComb = Array.new
        @year = PeriodizationYear.last
        @year.periodization_cycles.each do |cycle|
            cycle.periodization_weeks.each do |week|
                @atpBike[$i] = week.goal_ctl_bike.round
                @atpRun[$i] = week.goal_ctl_run.round
                @atpSwim[$i] = week.goal_ctl_swim.round
                @atpComb[$i] = @atpBike[$i] + @atpRun[$i] + @atpSwim[$i]
                $i +=1;
            end
        end
        return @atpBike, @atpRun, @atpSwim, @atpComb
    end
end
