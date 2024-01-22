import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["flashMessage"]

  connect() {
    this.flashMessageTarget.classList.add('fade-in');
    this.hideAfterDelay();
  }

  close() {
    this.flashMessageTarget.classList.replace('fade-in', 'fade-out');
    this.flashMessageTarget.addEventListener('animationend', () => {
      this.flashMessageTarget.remove();
    });
  }

  hideAfterDelay() {
    setTimeout(() => {
      this.close();
    }, 3000);
  }
}
