import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["budget", "flight", "type", "submit", "next", "back", "owdate"]
  static values = {
    currentStep: String,
    flightStep: String
  }

  connect() {
    console.log("stimulus connected 1")
    console.log(this.currentStepValue);
  }

  clearActive() {
    const targets = [this.budgetTarget, this.typeTarget, this.flightTarget,
                    this.submitTarget, this.owdateTarget];

    targets.forEach(target => console.log(target))
    targets.forEach(target => target.classList.remove('active'))
  }

  /**
   * Next button action
   * checks this.currentStepValue to move on to next step
   */
   next() {
    console.log("Hello");
    console.log(this.currentStepValue);
    switch (this.currentStepValue) {
      case 'budget':
        this.clearActive()
        this.backTarget.classList.remove('d-none')
        this.flightTarget.classList.add('active')
        this.submitTarget.classList.add('d-none')
        this.currentStepValue = "flight"
        break;

      case 'flight':
        this.clearActive()
        this.backTarget.classList.remove('d-none')
        this.typeTarget.classList.add('active')
        this.submitTarget.classList.remove('d-none')
        this.owdateTarget.classList.remove('d-none')
        this.currentStepValue = "type"
        break;

      default:
        console.error(`No action found for ${this.currentStepValue}`);
        break;
    }
  }
  /**
   * Back button action
   * checks this.currentStepValue to move back to previous step
   */
  back() {
    switch (this.currentStepValue) {
      case 'budget':
      break;

      case 'flight':
        this.clearActive()
        this.backTarget.classList.remove('d-none')
        this.budgetTarget.classList.add('active')
        this.nextTarget.classList.remove('d-none')
        this.submitTarget.classList.add('d-none')
        this.currentStepValue = "budget"
        break;

      case 'type':
        this.clearActive()
        this.backTarget.classList.remove('d-none')
        this.flightTarget.classList.add('active')
        this.nextTarget.classList.remove('d-none')
        this.submitTarget.classList.add('d-none')
        this.currentStepValue = 'flight'
        break;

      // case 'rtdate':
      // case 'owdate': {
      //   this.clearActive()
      //   this.backTarget.classList.remove('d-none')
      //   this.typeTarget.classList.add('active')
      //   this.submitTarget.classList.add('d-none')
      //   this.currentStepValue = 'type'
      // break;
      // }

      default:
        console.error(`No action found for ${this.nextStepValue}`);
        break;
    }
  }

  flightYes(){
    this.owdateTarget.classList.toggle('d-none')
  }

  flightNo(){
    this.owdateTarget.classList.toggle('d-none')
  }

}

      // -------- DO NOT REMOVE --------------
      // case 'companion':
      //   this.clearActive()
      //   if(this.flightStepValue === "yes") {
      //     this.backTarget.classList.remove('d-none')
      //     this.nextTarget.classList.remove('d-none')
      //     this.rtdateTarget.classList.add('active')
      //     this.submitTarget.classList.add('d-none')
      //     this.currentStepValue = 'rtdate'

      //   } else {
      //     this.backTarget.classList.remove('d-none')
      //     this.owdateTarget.classList.add('active')
      //     this.nextTarget.classList.remove('d-none')
      //     this.submitTarget.classList.add('d-none')
      //     this.currentStepValue = 'owdate'
      //   }


      // flightNo(){
      //   if (this.currentStepValue = 'owflight') {
      //     this.clearActive()
      //     this.backTarget.classList.remove('d-none')
      //     this.owdateTarget.classList.add('active')
      //     this.submitTarget.classList.remove('d-none')
      //     this.nextTarget.classList.add('d-none')
      //     this.currentStepValue = 'owdate'
      //     this.flightStepValue= "no"
      //   }
      // }


        // flightYes(){
  //   if (this.currentStepValue = 'rtflight') {
  //     this.clearActive()
  //     this.backTarget.classList.remove('d-none')
  //     this.rtdateTarget.classList.add('active')
  //     this.submitTarget.classList.remove('d-none')
  //     this.nextTarget.classList.add('d-none')
  //     this.currentStepValue = 'rtdate'
  //     this.flightStepValue= "yes"
  //   }
  // }
