# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Модуль создания турбазы
create_hostel = angular.module 'create_hostel', []

# Инициализация приложения
create_hostel.controller 'create_init_ctrl', ($scope) ->
  $scope.phone = '';
  $scope.countries = countries
  $scope.region_options = []
  $scope.cities_options = []
  # Обработка смены страны
  $scope.change_country = () ->
    for item in $scope.countries
      if item.id is $scope.select_country
        $scope.region_options = item.regions
        $scope.phone = item.code
        $scope.cities_options = []
  # Обработка смены региона
  $scope.change_region = () ->
    $scope.cities_options = item.cities for item in regions when item.id is $scope.regions and item.country_id is $scope.select_country
  # Обработка смены города
  $scope.change_city = () ->
    country_code = $scope.phone
    city_code = item.code for item in cities when item.id is $scope.cities
    $scope.phone = country_code + ' (' + city_code + ') '