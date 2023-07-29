import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-review"
export default class extends Controller {
  static targets = ["reviews"]

  connect() {
    console.log("hello from the reviews controller")
  }

  create(event) {
    event.preventDefault();
    const form = event.target
    const url = form.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json"},
      body: new FormData(form)
    })
    .then((response) => { return response.json()})
    .then((data) => {
      console.log(data)
      if(data.review_html) {
        this.reviewsTarget.insertAdjacentHTML('afterbegin', data.review_html)
      }
      form.outerHTML = data.form_html
    })
  }

}
