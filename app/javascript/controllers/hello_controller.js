import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("HELLO")
    // this.element.textContent = "Hello World!"
  }
}
