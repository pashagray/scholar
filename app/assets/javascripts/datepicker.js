document.addEventListener("turbolinks:load", function() {
  $('.datepicker').daterangepicker(
    {
      singleDatePicker: true,
      showDropdowns: true,
      useCurrent: false,
      defaultDate: false,
      minDate: moment('19300101', 'YYYYMMDD'),
      locale: {
        format: 'YYYY-MM-DD',
      }
    }
  );
})