# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#periodization_year_season_start').datepicker({dateFormat: 'D, dd M yy'})
    $('#periodization_year_season_end').datepicker({dateFormat: 'D, dd M yy'})