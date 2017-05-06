import $ from 'jquery'
$.fn.transition = require('semantic-ui-transition')

$(function () {
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade')
  })
})
