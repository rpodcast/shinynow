$( document ).ready(function() {
  var d = new Date();
  var targetDate = $('#clientDate');
  // https://stackoverflow.com/a/35922073
  targetDate.val(d.toISOString().slice(0, 10));
});
