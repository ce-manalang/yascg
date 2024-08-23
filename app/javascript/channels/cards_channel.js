import CableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("CardsChannel", {
  connected() {
    console.log("hello world")
  },
  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
});