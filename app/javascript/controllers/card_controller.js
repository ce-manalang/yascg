import { Controller } from "@hotwired/stimulus";
import CableReady from 'cable_ready'

export default class extends Controller {

  connect() {
    this.channel = this.application.consumer.subscriptions.create(
      {
        channel: 'CardChannel'
      },
      {
        received (data) { if (data.cableReady) CableReady.perform(data.operations) }
      }
    )
  }
  
  disconnect () {
    this.channel.unsubscribe()
  }
}