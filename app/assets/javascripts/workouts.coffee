# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#calendar').fullCalendar
        events: '/workouts.json'
        firstDay: 1
        weekNumbers: true
        height: 650
        eventColor: "#A5A5A5"
        eventTextColor: "#000000"
    $('#workout_date').datepicker({dateFormat: 'D, dd M yy'})