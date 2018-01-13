document.addEventListener("turbolinks:load", function() {
  $('.time-ago').each(function(index, item) {
    // console.log($(item))
    $(item).html(moment($(item).data('val')).fromNow());
  });
})