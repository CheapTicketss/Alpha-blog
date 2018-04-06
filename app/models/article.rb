class Article <  ActiveRecord::Base
  
  #insures there is a title in the datate base befoew a save 
  validates :title, presence: true, length: {minimum: 3, maximum: 50}  #number of chars
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  
  
end 