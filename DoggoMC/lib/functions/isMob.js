const checkEntity = function(entity) {
    if (!entity) {
      return console.log("WARNING: Entity isn't provided!")
    }
    if (entity.type === 'player') {
      return false
    } else if (entity.type === 'mob'){
      return true
    } else {
      return false
    }
}
module.exports = checkEntity;