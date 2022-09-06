import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="select-from-cards"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log(this.element);
    console.log(this.cardTarget);
  }

  click(event) {
    event.preventDefault();
    console.log("TODO: send request in AJAX");
    const flights = this.cardTarget.dataset.amount;
    this.cardTargets[
      event.currentTarget.dataset.value
    ].firstElementChild.classList.toggle("card-focus");
    console.log(event.currentTarget.dataset.value);
    // console.log(flights)
    //console.log(flights.dataset.amount);
  }
}
