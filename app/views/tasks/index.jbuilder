json.array! @tasks do |p|
  json.id p.id
  json.category p.category
  json.text p.text
  json.var1 p.var1
  json.var2 p.var2
  json.var3 p.var3
  json.var4 p.var4
  json.answer p.answer
  json.image p.image
  json.background_color p.background_color
  json.contest_id p.contest_id
  json.time l(p.created_at)
end
