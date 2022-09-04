import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatId: Number
  }

  connect() {
    console.log("connecting to the ActionCable channel with id ${this.chatIdValue}")

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: (data) => { this.#insertMessage(data) } }
    )
  }


  disconnect() {
    console.log("Disconnecting from channel")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    const form = event.target
    form.reset()
  }

  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
