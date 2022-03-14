class Article < Granite::Base
  connection pg
  table articles

  column id : Int64, primary: true
  column title : String?
  column body : String?
  timestamps

  validate_not_blank :title
  validate_min_length :title, 6
  validate_max_length :title, 100

  validate_not_blank :body
  validate_min_length :body, 20
end
