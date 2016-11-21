class PagesController < ApplicationController
  def index
  end

  def pmc
    @p = Pmc.new
    @atl = @p.calcPMCValues(7)
    @ctl = @p.calcPMCValues(42)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"PMC"})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'line',:name=> 'CTL', :color=> '#0477f9', :data=> @ctl )
      f.series(:type=> 'line',:name=> 'ATL', :color=> '#ea02bc', :data=> @atl )
      f.series(:type=> 'column',:name=> 'TSB', :color=> '#ffff00', :data=> @p.calcTSB(@atl,@ctl) )
    end
  end
end
