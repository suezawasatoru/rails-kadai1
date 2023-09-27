module EventsHelper

  def time_today
    t = Time.now
    t.strftime("本日の日付 %Y/%m/%d")
  end

  def event_count
    Event.count
 end

 
end
