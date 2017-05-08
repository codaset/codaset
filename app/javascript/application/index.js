import $ from 'jquery'
$.fn.transition = require('semantic-ui-transition')
$.fn.dropdown = require('semantic-ui-dropdown')

$(function () {
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade')
  })

  // $('.ui.dropdown').dropdown({
  //   on: 'hover'
  // })
})
