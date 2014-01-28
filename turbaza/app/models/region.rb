# Таблица региона
class Region < ActiveRecord::Base
    
    belongs_to :country # Страна, в которой регион.
    
end
