class EventsController < ApplicationController


  
  def by_month
    @colors = {
      notice: 'orange',
      timetable: 'green',
      contest: 'blue'
    }
    month = params[:filter][:month]
    year = params[:filter][:year]
    @timetables = Timetable.where(date: (Date.new(year, month, 1)..Date.new(year, month, -1)))
    @notices = Notice.where(date: (Date.new(year, month, 1)..Date.new(year, month, -1)))
    @contests = Contest.where(date: (Date.new(year, month, 1)..Date.new(year, month, -1)))

    events = []
    
    @timetables.each do |single|
      temp = {
        id: single.id,
        title: "#{single.semester} Sem #{single.title}",
        date: single.date.strftime("%Y-%m-%d"),
        description: single.description,
        created_date: single.created_at.strftime("%Y-%m-%d"),
        semester: single.semester,
        event_type: 'timetable',
        content_url: single.url,
        color: @colors[:timetable]
      }
      events << temp
    end

    @notices.each do |single|
      temp = {
        id: single.id,
        title: single.title,
        description: single.description,
        date: single.date.strftime("%Y-%m-%d"),
        created_date: single.created_at.strftime("%Y-%m-%d"),
        event_type: 'notice',
        content_url: single.url,
        color: @colors[:notice]
      }
      events << temp
    end

    @contests.each do |single|
      temp = {
        id: single.id,
        title: single.title,
        description: single.description,
        date: single.date.strftime("%Y-%m-%d"),
        created_date: single.created_at.strftime("%Y-%m-%d"),
        event_type: 'contest',
        content_url: single.url,
        color: @colors[:contest]
      }
      events << temp
    end
    
    render json: events, status: 200  

  end


end
