// import * as $ from "jquery";
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application 

export { application }

// console.log(`jQuery version: ${$.fn.jquery}`); // jQuery version: 3.6.0
