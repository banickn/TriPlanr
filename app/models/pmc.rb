class Pmc
  include ActiveModel::AttributeMethods

    def initialize
        @setting = Setting.find(1)
        @seasonStart = @setting.season_start
        @seasonEnd = @setting.season_end
        @seasonDuration = (@seasonEnd - @seasonStart).to_i
    end

    def calcATL(day, offset, period)
        day = Workout.find_by date: day
        expFactor = Math.exp(-1.0/period)
        if day.nil?
            @atl = offset * expFactor
        else
            @atl = (day.tss * (1 - expFactor)) + (offset * expFactor)
        end
        @atl.round(2)
    end

    def calcTSB(atl, ctl)
        @tsbArray = Array.new()
        atl.zip(ctl).each do |atlValue, ctlValue|
            tsbValue = atlValue - ctlValue
            @tsbArray << tsbValue.round(2)
        end
        return @tsbArray
    end

    def calcPMCValues(period)
        $i = 0
        @pmcArray = Array.new(@seasonDuration)
        while $i < @seasonDuration do
            if $i == 0
                @pmcArray[$i] = calcATL((@seasonStart + $i), 20, period)
            else
                @pmcArray[$i] = calcATL((@seasonStart + $i), @pmcArray[$i - 1], period)
            end
            $i +=1;
        end
        return @pmcArray
    end
end
