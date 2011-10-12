$(document).ready(function(){
  
  $('#messageField').hide();
  $('#adminLogin').hide();
  $('#newsfield').hide();
  
  $('#toggleButton').click(function(){
    $('#messageField').slideToggle();
  });
  
  $('#adminLink').click(function(){
    $('#adminLogin').slideToggle('fast');
  })
  
  $('#newsletterButton').click(function(){
    $('#newsfield').slideToggle();
  });
  
});