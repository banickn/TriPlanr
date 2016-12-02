class Pmc
  include ActiveModel::AttributeMethods

    def initialize
        @year = PeriodizationYear.last
        @seasonStart = @year.season_start
        @seasonEnd = @year.season_end
        @seasonDuration = (@seasonEnd - @seasonStart).to_i
    end

    def calcPMC(period, sportCategory)
        $k = 0
        $n = 0
        sport = Sport.find_by name: sportCategory
        @pmcArray = Array.new(@seasonDuration)

        # fetch all workouts per sport once and iterate through array
        day = sport.workouts.to_a.map(&:serializable_hash)
        while $k < @seasonDuration do
            $currentDate = @seasonStart + $k
            if !day[$n].nil? && day[$n]["date"] == $currentDate
                # found workout
                $value = calcATL(day[$n]["tss"], @pmcArray[$k - 1][1], period)
                $n += 1
            elsif $k != 0
                # no workout
                $value = calcATL(0, @pmcArray[$k - 1][1], period)
            else
                # day 1
                $value = calcATL(0, 20, period)
            end
            @pmcArray[$k] = [$currentDate, $value]
            $k +=1
        end
        return @pmcArray
    end

    def calcATL(tss, offset, period)
        expFactor = Math.exp(-1.0/period)
        @atl = (tss * (1 - expFactor)) + (offset * expFactor)

        return @atl.round(2)
    end

    def calcTSB(atl, ctl)
        $i = 0
        @tsbArray = Array.new()
        atl.zip(ctl).each do |atlValue, ctlValue|
            $currentDate = @seasonStart + $i
            tsbValue = atlValue.last - ctlValue.last
            @tsbArray << [$currentDate, tsbValue.round(2)]
            $i +=1
        end
        return @tsbArray
    end
end
