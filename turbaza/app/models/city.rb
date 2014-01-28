# Таблица города.
class City < ActiveRecord::Base
    
    belongs_to :region # Связь с регионом.
    
end
