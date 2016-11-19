class Pmc
  include ActiveModel::AttributeMethods

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
        @pmcArray = Array.new(20)
        while $i < 20  do
            if $i == 0
                @pmcArray[$i] = calcATL((Date.today + $i), 20, period)
            else
                @pmcArray[$i] = calcATL((Date.today + $i), @pmcArray[$i - 1], period)
            end
            $i +=1;
        end
        return @pmcArray
    end
end
