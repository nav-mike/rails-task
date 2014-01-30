# Класс страны.
# Описание таблицы
# name       string Название страны.
# phone_code string Код страны.
class Country < ActiveRecord::Base
    
    # Проверка уникальности.
    validates :name, uniqueness: true

    has_many :regions, dependent: :destroy

    # Список регионов текущей страны
    attr_accessor :ui_regions
    
end
