import { Controller } from "@hotwired/stimulus"

const refreshInterval = 1000 // 1 second
export default class extends Controller {
  static values = { expires: String }
  connect() {
    this.startRefreshing()
  }

  startRefreshing() {
    setInterval(() => {
      var expireDate = new Date(this.expiresValue)
      var now = new Date()
      var diffMillis = expireDate - now
      if (diffMillis <= 0) {
        window.location.href = '/sessions/new'
        return
      } 
      var diffseconds = Math.floor(diffMillis / 1000 % 60)
      var diffMinutes = Math.floor(diffMillis / (1000 * 60))

      this.element.innerText = (`${diffMinutes}:${diffseconds} remaining`)
    }, refreshInterval)
  }
}
