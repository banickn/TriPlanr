class PagesController < ApplicationController
  def index
    @pageTitle = "TSS"
  end

  def pmc
    @pageTitle = "Performance Managing Chart"
    @p = Pmc.new
    @atlBike = @p.calcPMC(7, "Bike")
    @ctlBike = @p.calcPMC(42, "Bike")
    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"PMC Bike"})
      f.chart({ :zoomType => 'x'})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'line',:name=> 'CTL', :color=> '#0477f9', :data=> @ctlBike )
      f.series(:type=> 'line',:name=> 'ATL', :color=> '#ea02bc', :data=> @atlBike )
      f.series(:type=> 'column',:name=> 'TSB', :color=> '#ffff00', :data=> @p.calcTSB(@atlBike,@ctlBike) )
    end

    @atlRun = @p.calcPMC(7, "Run")
    @ctlRun = @p.calcPMC(42, "Run")
    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"PMC Run"})
      f.chart({ :zoomType => 'x'})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'line',:name=> 'CTL', :color=> '#0477f9', :data=> @ctlRun )
      f.series(:type=> 'line',:name=> 'ATL', :color=> '#ea02bc', :data=> @atlRun )
      f.series(:type=> 'column',:name=> 'TSB', :color=> '#ffff00', :data=> @p.calcTSB(@atlRun,@ctlRun) )
    end

   @atlSwim = @p.calcPMC(7, "Swim")
   @ctlSwim = @p.calcPMC(42, "Swim")
    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"PMC Swim"})
      f.chart({ :zoomType => 'x'})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'line',:name=> 'CTL', :color=> '#0477f9', :data=> @ctlSwim )
      f.series(:type=> 'line',:name=> 'ATL', :color=> '#ea02bc', :data=> @atlSwim )
      f.series(:type=> 'column',:name=> 'TSB', :color=> '#ffff00', :data=> @p.calcTSB(@atlSwim,@ctlSwim) )
    end
  end
end
