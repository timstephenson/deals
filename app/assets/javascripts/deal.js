$.periodic({period: 2000, decay: 1.2, max_period: 60000}, function() {
  $.getJSON(aaDealPath, function(data) {
  	jQuery('.inventory').html(data['inventory']);
  });
});
