# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Формирование списка стран
$.each options, (id, item) ->
  $('#country').append($('<option></option>').attr('value', item.id).text(item.name))

# Функция получения списка регионов
get_regions = (country_id) ->
  result = []
  $.each countries, (index, value) ->
    if value.id is country_id
      result = value.regions
  result

# Установка текущего значения региона
country_selected = $('#country').val()
new_regions = get_regions country_selected
$.each new_regions, (it, item) ->
  $('#city_region_id').append($('<option></option>').attr('value', item.id).text(item.name))

# Изменение списка регионов
$('#country').on 'change', (e) ->
  regs = get_regions this.value
  $.each regs, (it, item) ->
    $('#city_region_id').find('option').remove().end().append($('<option></option>').attr('value', item.id).text(item.name))