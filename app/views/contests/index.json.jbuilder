json.contests @contests do |contest|
  json.merge! contest.attributes
  json.status Date.today > contest.date.to_date ? 'expired': ( Date.today == contest.date.to_date ? 'live' : 'upcoming')
end

json.total_count @total_count
