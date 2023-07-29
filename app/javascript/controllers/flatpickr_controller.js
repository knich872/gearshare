// app/javascript/controllers/flatpickr_controller.js

import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = ["startTime", "endTime", "rentalPriceValue", "totalAmount"]

  connect() {
    console.log("Hello from flatpickr controller");
    flatpickr(this.startTimeTarget, {
      plugins: [new rangePlugin({ input: "#end_time" })],
      defaultDate: "today",
      minDate: "today",
      altInput: true,
    })
    flatpickr(this.endTimeTarget, {
      defaultDate: "today",
      minDate: "today",
      altInput: true,
    })
    this.calculateAmount();
  }

  calculateAmount() {
    const startDate = this.startTimeTarget.value;
    console.log(new Date(startDate));
    const endDate = this.endTimeTarget.value;
    console.log(endDate);
    const rentalPrice = this.element.querySelector("[data-rental-price-value]").dataset.rentalPriceValue;
    console.log(rentalPrice);
    if (startDate && endDate) {
      const daysDiff = Math.ceil((new Date(endDate) - new Date(startDate)) / (1000 * 60 * 60 * 24)) + 1;
      const totalAmount = rentalPrice * daysDiff;

      this.totalAmountTarget.textContent = `¥${totalAmount}`;
    } else {
      this.totalAmountTarget.textContent = `¥${rentalPrice}`;
    }
  }
}
