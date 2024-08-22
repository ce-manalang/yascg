import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("connected");
    const cards = document.getElementById("cards");
    if (cards) {
      cards.addEventListener("DOMNodeInserted", this.resetScroll);
      this.resetScroll(cards);
    }
  }
  disconnect() {
    cards.removeEventListener("DOMNodeInserted", this.resetScroll);
  }
  resetScroll() {
    cards.scrollTop = cards.scrollHeight - cards.clientHeight;
  }
}