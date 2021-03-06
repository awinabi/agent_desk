$(document).ready(function(){
  $('.dropdown').hover(function(){
    $(this).find('.dropdown-menu').slideDown(100);
  }, function(){
    $(this).find('.dropdown-menu').slideUp(100);
  });

  window.setInterval(function(){
    $('.alert').fadeOut();
    $('.notice').fadeOut();
  }, 5000);

  $('h2.collapsible').click(function(){
    $(this).siblings('.collapsible-content').toggle();
  });

  $("#from").datepicker({
    dateFormat: 'dd MM yy',
    minDate: new Date(2001, 1 - 1, 1),
  });
  $("#to").datepicker({
    dateFormat: 'dd MM yy',
    minDate: new Date(2001, 1 - 1, 1),
  });

});