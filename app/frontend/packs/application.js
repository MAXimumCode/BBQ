import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../styles/application.scss'
import '../scripts/javascript.js'
const images = require.context('../../frontend/images', true)
const imagePath = (name) => images(name, true)

import 'bootstrap/dist/js/bootstrap'

Rails.start()
ActiveStorage.start()




