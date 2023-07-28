import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      enableTime: false,
      plugins: [new rangePlugin({ input: "#end_time"})],
      defaultDate: "today",
      minDate: "today",
      altInput: true,
    })
    flatpickr(this.endTimeTarget, {
      defaultDate: "today",
      minDate: "today",
      altInput: true,
    })
  }
}
