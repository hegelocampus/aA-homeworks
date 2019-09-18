console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b', function(result){ 
  console.log("test 1");
  console.log(result);
});
$.ajax({
  type: 'GET',
  datatype: 'json',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=b90accfaa611f043e4cb9318a2885392',
  success: function(result){ 
    console.log(result);
    console.log("test 2");
  }
});


// Add another console log here, outside your AJAX request
console.log("ahhh");
