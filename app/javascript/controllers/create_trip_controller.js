import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-trip"
export default class extends Controller {
  static targets = ["budget", "flight", "companion", "type", "date", "submit", "button"]

  connect() {
    console.log("stimulus connected 2")
    console.log(this.budgetTarget)
    console.log(this.flightTarget)
    console.log(this.companionTarget)
  }

  send(e){

    if(!this.budgetTarget.className.includes("d-none")){
      this.budgetTarget.classList.toggle("d-none")
      this.flightTarget.classList.toggle("d-none")
    }
    else if(!this.flightTarget.className.includes("d-none")) {
      this.typeTarget.classList.toggle("d-none")
      this.flightTarget.classList.toggle("d-none")
    }
    else if(!this.typeTarget.className.includes("d-none")) {
      this.dateTarget.classList.toggle("d-none")
      this.typeTarget.classList.toggle("d-none")
    }
    else if(!this.dateTarget.className.includes("d-none")) {
      this.companionTarget.classList.toggle("d-none")
      this.dateTarget.classList.toggle("d-none")
    }
    else if(!this.companionTarget.className.includes("d-none")){
      // this.companionTarget.classList.toggle("d-none")
       this.buttonTarget.classList.add("d-none")
       this.submitTarget.classList.remove("d-none")

    }
  }
}
