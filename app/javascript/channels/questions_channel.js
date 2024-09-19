import { createConsumer } from "@rails/actioncable"
import CableReady from 'cable_ready'
import { Turbo } from "@hotwired/turbo-rails"

const consumer = createConsumer()

consumer.subscriptions.create(
  { channel: "QuestionsChannel", game_session_id: "your_session_id" },
  {
    received(data) {
      if (CableReady.enabled) {
        CableReady.perform(data)
      } else {
        // Handle data updates manually if needed
        console.log('Received:', data)
      }
    }
  }
)