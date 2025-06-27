import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  connect() {
    const type = this.data.get("type")
    const message = this.data.get("message")

    if (message) {
      Swal.fire({
        icon: type || 'info',
        title: type === "error" ? "Oops!" : "Success",
        text: message,
        timer: 2000,
        timerProgressBar: true,
        showConfirmButton: false
      })
    }
  }
}
