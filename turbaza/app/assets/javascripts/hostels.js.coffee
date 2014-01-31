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
  console.log h_region_select
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