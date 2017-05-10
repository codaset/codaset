export default (state = [], action) => {
  switch (action.type) {
    case 'LOAD_CARDS_SUCCESS':
      return Object.assign({}, state, action.payload.data)
    default:
      return state
  }
}