import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  connect() {
    if (localStorage.getItem("dark") === "true") {
      document.documentElement.classList.add("dark")
    }
  }

  toggle() {
    const isDark = document.documentElement.classList.toggle("dark")
    localStorage.setItem("dark", isDark)
  }
}
