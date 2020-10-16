const itemToString = function(item) {
    if (item) {
      return `${item.name} x ${item.count}`
    } else {
      return '(nothing)'
    }
}
module.exports = itemToString;