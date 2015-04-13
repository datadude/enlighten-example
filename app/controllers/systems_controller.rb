class SystemsController < ApplicationController
  around_filter :set_time_zone, except: :index

  def show
    @production = @system.monthly_production(:start_date=>1.month.ago - (3600*24))
    start_time = Time.now
    @stats = @system.stats(:start_at=>Time.local(start_time.year,start_time.month,start_time.day,0,0), :end_at=>Time.now)
  end

  def graph
    start_time = Time.now
    @intervals = @system.stats(:start_at=>Time.local(start_time.year,start_time.month,start_time.day,0,0), :end_at=>Time.now).intervals
  end

  def index
    @systems =  Enlighten::System.new(user_id: '4d7a45774e6a41320a').systems
  end

  private
    def set_time_zone
      old_time_zone = Time.zone
      @system = Enlighten::System.new(id: params[:id].to_i)
      Time.zone = @system.timezone
      yield
    ensure
      Time.zone = old_time_zone
    end
end
