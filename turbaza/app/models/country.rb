# Класс страны.
# Описание таблицы
# name       string Название страны.
# phone_code string Код страны.
class Country < ActiveRecord::Base
    
    # Проверка уникальности.
    validates :name, uniqueness: true
    
end
