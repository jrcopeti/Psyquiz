import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-check"
export default class extends Controller {
  static targets = ["answer", "submit"];
  connect() {
    this.checkAnswers();
  }
  checkAnswers() {
    const isAnyAnswerChecked = this.answerTargets.some(answer => answer.checked);
    this.submitTarget.disabled = !isAnyAnswerChecked;
  }
}

// code for checking answers 
