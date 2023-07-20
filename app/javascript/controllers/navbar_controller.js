import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["bar"]

  connect() {
    console.log("hello from the navbar controller")
  }

  stick() {
    console.log("scrolling...")
    const div56 = document.getElementById("navbar-offset-div");
    if (window.scrollY >= 56) {
      if (display === none) {
        div56.style.display = block;
      }
      // this.barTarget.classList.add("sticky")
    } else {
      console.log("this is the else")
      // this.barTarget.classList.remove("sticky");
      div56.style.display = none;
    }
  }
}
