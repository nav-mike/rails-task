# Таблица турбаз
class Hostel < ActiveRecord::Base
    
    belongs_to :city # Связь с городом
    
end
