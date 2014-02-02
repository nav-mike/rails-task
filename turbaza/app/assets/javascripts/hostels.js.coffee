# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # Формирование списка стран
  $.each countries, (key, value) ->
    $('#inputCountry').append($('<option></option>').attr('value', value.id).text(value.name))

  # Значение телефона
  code = ''

  # Получение кода телефона страны
  get_country_code = (country_id) ->
    $.each countries, (index, value) ->
        if value.id is country_id
          code = value.code
          $('#c_code').text(code)
    code

  # Получение кода телефона города
  get_city_code = (city_id) ->
    $.each cities, (key, value) ->
      if value.id is city_id
        code = ' (' + value.code + ') '
        $('#ct_code').text(code)

  # Функция получения списка регионов
  get_regions = (country_id) ->
    result = []
    $.each countries, (index, value) ->
      if value.id is country_id
        result = value.regions
    result

  # Функция получения списка городов
  get_cities = (region_id) ->
    result = []
    $.each regions, (index, value) ->
      if value.id is region_id
        result = value.cities
    result

  # Изменение текущей страны
  $('#inputCountry').on 'change', (e) ->
    get_country_code this.value
    regs = get_regions this.value
    $('#inputRegion').find('option').remove().end()
    $('#hostel_city_id').find('option').remove().end()
    $.each regs, (it, item) ->
      $('#inputRegion').append($('<option></option>').attr('value', item.id).text(item.name))

    h_region_select = $('#inputRegion').val()
    new_cities = get_cities h_region_select
    $.each new_cities, (it, item) ->
      $('#hostel_city_id').append($('<option></option>').attr('value', item.id).text(item.name))
    get_city_code( $('#hostel_city_id').val())

  # Установка текущего значения
  h_country_select = $('#inputCountry').val()
  get_country_code h_country_select

  # Установка текущего значения региона
  h_country_select = $('#inputCountry').val()
  new_regions = get_regions h_country_select
  $.each new_regions, (it, item) ->
    $('#inputRegion').append($('<option></option>').attr('value', item.id).text(item.name))

  # Установка текущего значения города
  h_region_select = $('#inputRegion').val()
  new_cities = get_cities h_region_select
  $.each new_cities, (it, item) ->
    $('#hostel_city_id').append($('<option></option>').attr('value', item.id).text(item.name))

  # Изменение списка городов
  $('#inputRegion').on 'change', (e) ->
    cs = get_cities this.value
    $('#hostel_city_id').find('option').remove().end()
    $.each cs, (it, item) ->
      $('#hostel_city_id').append($('<option></option>').attr('value', item.id).text(item.name))

  # Установка значения телефона
  city = $('#hostel_city_id').val()
  get_city_code(city)

  # Изменение значения города
  $('#hostel_city_id').on 'change', (e) ->
    city = this.value
    get_city_code(city)


  # При изменении записи
  if is_edit
    $('#inputCountry').val(country_value)
    new_regions = get_regions $('#inputCountry').val()
    get_country_code $('#inputCountry').val()
    $('#inputRegion').find('option').remove().end()
    $('#hostel_city_id').find('option').remove().end()
    $.each new_regions, (it, item) ->
      $('#inputRegion').append($('<option></option>').attr('value', item.id).text(item.name))
    $('#inputRegion').val(region_value)
    h_region_select = $('#inputRegion').val()
    new_cities = get_cities h_region_select
    console.log new_cities
    $.each new_cities, (it, item) ->
      $('#hostel_city_id').append($('<option></option>').attr('value', item.id).text(item.name))
    $('#hostel_city_id').val(city_value)
    city = $('#hostel_city_id').val()
    get_city_code(city)


# Код для angular приложения
# Инициализация приложения
hostels_filter_app = angular.module 'hostels_filter_app', []

# Функция получения текста страны по ее идентификатору
get_country_name_by_id = (id) ->
  result = item.text for item in countries when item.value is id
  result

# Функция получения текста региона по его идентификатору
get_region_name_by_id = (id) ->
  result = item.name for item in regions when item.id is id
  result

# Функция получения списка регионов
get_country_regions_by_id = (id) ->
  result = item.regions for item in countries when item.value is id
  result

# Функция получения списка городов
get_region_cities_by_id = (id) ->
  result = item.cities for item in regions when item.id is id
  result

# Контроллер
hostels_filter_app.controller 'init_filter_app_ctrl', ($scope) ->
  $scope.turbaza_list = hostels_list; # Инициализация списка турбаз
  $scope.countries = countries # Инициализация списка стран
  $scope.regions = [] # Инициализация списка регионов
  $scope.cities = [] # Инициализация списка городов
  $scope.vfilter = {'country': '', 'region': '', 'city': ''} # Инициализация фильтра

  # Смена страны
  $scope.change_country = () ->
    country_id = $scope.filter_var.country
    $scope.vfilter.country = get_country_name_by_id(country_id)
    console.log get_country_regions_by_id(country_id)
    $scope.regions = get_country_regions_by_id(country_id)

  # Смена региона
  $scope.change_region = () ->
    region_id = $scope.filter_var.region
    $scope.vfilter.region = get_region_name_by_id(region_id)
    $scope.cities = get_region_cities_by_id(region_id)

  # Смена города
  $scope.change_city = () ->
    $scope.vfilter.city = $scope.filter_var.city

  # Сброс фильтра
  $scope.reset = () ->
    $scope.vfilter.country = ''
    $scope.vfilter.region = ''
    $scope.vfilter.city = ''
    $scope.countries = []
    $scope.countries = countries
    $scope.regions = []
    $scope.cities = []