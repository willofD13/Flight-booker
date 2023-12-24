import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template","form"]

    renderForm() {
    
        if (formTarget.hasChildNodes()) {
            let clone = this.formTarget.lastChild.content.cloneNode(true)
            this.formTarget.appendChild(clone)
        } else {
            let clone = this.templateTarget.content.cloneNode(true)
            this.formTarget.appendChild(clone)
        }
    }

    deleteForm() {
        let field = document.querySelector(".fields")
        field.remove()
    }
}