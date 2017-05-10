export default (state = [], action) => {
  switch (action.type) {
    case 'LOAD_CARDS_SUCCESS':
      return Object.assign({}, state, action.payload.data)
    case 'RESIZE_WINDOW':
      return Object.assign({}, state, { windowHeight: action.windowHeight })
    default:
      return state
  }
}