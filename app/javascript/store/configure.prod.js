import { createStore, applyMiddleware } from 'redux'
import axios from 'axios'
import axiosMiddleware from 'redux-axios-middleware'

import reducer from 'card_board/reducers'

export default () => {
  const client = axios.create({
    responseType: 'json',
    headers: {
      'Accept': 'application/json'
    }
  })

  return createStore(
    reducer,
    applyMiddleware(axiosMiddleware(client))
  )
}
