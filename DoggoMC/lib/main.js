const isFood = require('./functions/isFood.js')
const nearestEntity = require('./functions/nearestEntity.js')
const nearestEntityEverywhere = require('./functions/nearestEntityEwerywhere.js')
const itemByName = require('./functions/itemByName.js')
const checkEntity = require('./functions/checkEntity.js')
const itemToString = require('./functions/itemToString.js')
const isMob = require('./functions/isMob.js')

module.exports.isFood = isFood;
module.exports.nearestEntity = nearestEntity;
module.exports.nearestEntityEverywhere = nearestEntityEverywhere;
module.exports.itemByName = itemByName;
module.exports.itemToString = itemToString;
module.exports.checkEntity = checkEntity;
module.exports.isMob = isMob;