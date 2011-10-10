$(document).ready(function(){
  
  $('#messageField').hide()
  $('#adminLogin').hide()
  
  $('#toggleButton').click(function(){
    $('#messageField').slideToggle();
  });
  
  $('#adminLink').click(function(){
    $('#adminLogin').slideToggle();
  })
});