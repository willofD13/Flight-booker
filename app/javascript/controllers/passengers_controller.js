import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template","form"]
    

    renderForm() {
        let clone = this.templateTarget.content.cloneNode(true)
        this.formTarget.appendChild(clone)
    }

    deleteForm() {
        let field = document.querySelector(".fields")
        this.formTarget.removeChild(field)
    }
}