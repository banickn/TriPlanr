class Atp < ApplicationRecord
    has_many :PeriodizationCycles

    def initialize
        @setting = Setting.find(1)
        @seasonStart = @setting.season_start
        @seasonEnd = @setting.season_end
        @goalCtlBikeMax = @setting.goal_ctl_bike_max
        @seasonDurationDays = (@seasonEnd - @seasonStart).to_i
        @seasonDurationWeeks = @seasonDurationDays / 7
    end

    def calcATP()
        $i = 0
        @atpHash = Hash.new
        @ctlBikeRamp = (@goalCtlBikeMax - 20.0) / @seasonDurationWeeks
        @periodizedBikeRamp = @ctlBikeRamp * 2
        print @ctlBikeRamp.round(2)
        print @periodizedBikeRamp.round(2)
        while $i < @seasonDurationWeeks do
            if $i == 0
                @atpHash[$i] = (20 + @periodizedBikeRamp).round(2)
            else
                if $i % 3 == 0
                    @atpHash[$i] = (@atpHash[$i - 1] - @ctlBikeRamp).round(2)
                else
                    @atpHash[$i] = (@atpHash[$i - 1] + @periodizedBikeRamp).round(2)
                end
            end
            $i +=1;
        end
        return @atpHash.to_a
    end
end
