import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  defaultDate: new Date().fp_incr(70),
  minDate: "today",
  dateFormat: "Y-m-d"
})
