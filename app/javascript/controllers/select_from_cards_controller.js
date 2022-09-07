import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="select-from-cards"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log("stimulus connected 12");
    console.log(this.cardTarget);
  }

  click(event) {
    event.preventDefault();
    const flights = this.cardTarget.dataset.amount;
    this.cardTargets.forEach((card) => {
      event.currentTarget.dataset.value !== card.dataset.value &&
        card.firstElementChild.classList.remove("card-focus");
    });
    this.cardTargets[
      event.currentTarget.dataset.value
    ].firstElementChild.classList.toggle("card-focus");

    console.log(`${event.currentTarget.dataset.value} is selected`);
    // console.log(flights)
    //console.log(flights.dataset.amount);
  }
}
