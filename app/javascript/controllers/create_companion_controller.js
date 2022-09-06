import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["wrapper", "form", "created"]
  static values = {
    trip: String
  }

  connect() {
    console.log("Controller 2");
    console.log(this.formTarget);
    console.log(this.wrapperTarget);
    console.log(this.tripValue);
  }

  addtraveller(e) {
    e.preventDefault()
    // `/trips/${this.tripValue}/add-companion`

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
          if (data.inserted_item) {
          this.wrapperTarget.insertAdjacentHTML("afterbegin", data.inserted_item)}
         this.formTarget.outerHTML = data.form
      })

    // fetch(`/trips/${this.tripValue}/add-companion`, { headers: {'Accept': 'text/plain'} })
    //   .then(res => res.text())
    //   .then(data => {
    //     this.wrapperTarget.insertAdjacentHTML('beforeend', data)
    //     //this.inputfieldTarget.insertAdjacentHTML('beporeend', data)
    //   })
  }

}
