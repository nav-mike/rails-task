# Таблица регионов
class Region < ActiveRecord::Base
    
    has_one :country, dependent: :destroy # Связывание с страной
    
end
