import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-from-cards"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log(this.element)
    console.log(this.cardTarget)
  }

  click(event) {
    event.preventDefault()
    console.log("TODO: send request in AJAX")
    const flights = this.cardTarget.dataset.amount
    this.cardTarget.firstElementChild.classList.toggle("card-focus");
    console.log(this.cardTarget.firstElementChild.classList);
    // console.log(flights)
    //console.log(flights.dataset.amount);
  }
}
