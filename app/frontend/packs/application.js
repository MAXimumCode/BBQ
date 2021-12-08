import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../styles/aplication.scss'
import 'bootstrap/dist/js/bootstrap'
const images = require.context('../images', true)

Rails.start()
ActiveStorage.start()




