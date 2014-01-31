# Таблица региона
class Region < ActiveRecord::Base
    
    belongs_to :country # Страна, в которой регион.

    # Список городов текущего региона
    attr_accessor :ui_cities
    
end
