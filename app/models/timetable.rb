class Timetable < ApplicationRecord

  validates_presence_of :title, :semester, :date, :url
end
