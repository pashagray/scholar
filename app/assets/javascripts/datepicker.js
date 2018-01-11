document.addEventListener("turbolinks:load", function() {
  $('.datepicker').daterangepicker(
    {
      singleDatePicker: true,
      showDropdowns: true,
      useCurrent: false,
      defaultDate: false,
      locale: {
        format: 'YYYY-MM-DD',
      }
    }
  );
})