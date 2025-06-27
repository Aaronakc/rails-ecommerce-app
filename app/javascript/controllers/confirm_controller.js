import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    message: String
  }

  confirm(event) {
    event.preventDefault()

    Swal.fire({
      title: 'Are you sure?',
      text: this.messageValue || "This action cannot be undone!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        // Submit the closest form or link
        if (this.element.tagName === "A") {
          Turbo.visit(this.element.href, { action: "replace" })
        } else {
          this.element.closest("form").requestSubmit()
        }
      }
    })
  }
}
