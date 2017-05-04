import $ from 'jquery'

$(function () {
  // Takes care of form inputs and label animation.
  $('form').find('input, select, textarea').each(function () {
    const $input = $(this)

    $input.next('label').show()

    $input.on('focus', () => { $input.removeClass('empty') })
    $input.on('blur',  () => { $input.val() === '' && $input.addClass('empty') })

    $input.val() === '' && $input.addClass('empty')
  })
})
