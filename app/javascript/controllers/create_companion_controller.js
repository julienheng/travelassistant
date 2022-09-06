import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["inputfield", "wrapper"]
  static values = {
    trip: String
  }

  connect() {
    console.log("Controller 3");
    console.log(this.inputfieldTarget)
    console.log(this.tripValue);
  }

  addtraveller(e) {
    e.preventDefault()

    fetch(`/trips/${this.tripValue}/add-companion`, { headers: {'Accept': 'text/plain'} })
      .then(res => res.text())
      .then(data => {
        this.wrapperTarget.insertAdjacentHTML('beforeend', data)
        //this.inputfieldTarget.insertAdjacentHTML('beforeend', data)
      })


  }

  submit(e) {

    // e.preventDefault()

    // fetch(`/trips/${this.tripValue}/add-companion`, { headers: {'Accept': 'text/plain'} })
    //   .then(res => res.text())
    //   .then(data => {
    //     this.wrapperTarget.insertAdjacentHTML('beforeend', data)
    //   })

  }
}
