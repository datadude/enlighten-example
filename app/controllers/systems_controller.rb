class SystemsController < ApplicationController

  def home
    @system = Enlighten::System.new(params[:id])
    @summary = @system.summary
    @inventory = @system.inventory
    @envoys = @system.envoys
    @production = @system.monthly_production(:start_date=>1.month.ago - (3600*24))
    @start_day
    @stats = @system.stats(:start_at=>DateTime.new(Time.now.year,Time.now.month,Time.now.day,7,0), :end_at=>Time.now)
  end

  def graph
    @intervals = Enlighten::System.new(params[:id]).stats(:start_at=>DateTime.new(Time.now.year,Time.now.month,Time.now.day,7,0), :end_at=>Time.now).intervals
  end
end
