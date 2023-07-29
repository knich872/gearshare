import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-amount"
export default class extends Controller {
  static targets = ["startDate", "endDate", "totalAmount"];
  static values = { rentalPrice: Number };

  connect() {
    console.log("Booking Amount controller connected!");
    this.calculateAmount(); // Initial calculation
  }

  calculateAmount() {
    const rentalPrice = this.rentalPriceValue;
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    // Calculate the number of days between start and end date
    const oneDay = 24 * 60 * 60 * 1000;
    const diffDays = Math.round(Math.abs((endDate - startDate) / oneDay)) + 1;

    const totalAmount = rentalPrice * diffDays;
    this.totalAmountTarget.textContent = `¥${totalAmount}`;
    console.log(totalAmount);
  }
}
