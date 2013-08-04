//= require twitter/bootstrap
//= require unicorn

//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-zh-TW
//= require jquery.ui.slider
//= require jquery.timepicker

//= require_self




$(document).ready(function() {
  $('.datepicker').datepicker({
    dateFormat: "yy-mm-dd"
  });
});

$(document).ready(function() {
  $(".datetimepicker").each(function(){
    $(this).datetimepicker({
      dateFormat: "yy-mm-dd",
      hourGrid: 4,
      minuteGrid: 10,
      stepMinute: 10
    });
  });
});


$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field; 
  // it's a jQuery object already! Now you can find date input
  // var dateField = field.find('.date');
  // dateField.datepicker(); // and activate datepicker on it
})
