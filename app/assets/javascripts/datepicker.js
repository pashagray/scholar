document.addEventListener("turbolinks:load", function() {
  $('.datepicker').daterangepicker(
    {
      singleDatePicker: true,
      showDropdowns: true,
      locale: {
        format: 'YYYY-MM-DD',
      }
    }
  );
})