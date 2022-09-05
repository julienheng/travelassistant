import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["inputfield"]

  connect() {
    console.log("Controller 2");
    console.log(this.inputfieldTarget)
  }

  addTravellerFields() {
    const tag = `<div class="traveller-detail d-flex justify-content-between">
    <%= f.input :name, input_html: { class: "name-input rounded-pill" } %>
    <%= f.input :age, input_html: { class: "age-input rounded-pill" } %>
  </div>`
    this.inputfieldTarget.insertAdjacentHTML("beforeend", tag);
  }
}
