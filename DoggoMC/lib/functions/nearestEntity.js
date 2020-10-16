const nearestEntity = function(bot) {
    if (!bot) {
      throw new Error("Bot instance isn't provided!")
    }
    let id
    let entity
    let dist
    let best = null
    let bestDistance = null
    for (id in bot.entities) {
      entity = bot.entities[id]
      const checkEntity = require('./checkEntity.js')
      const isMob = require('./isMob.js')
      if (!checkEntity(entity)) continue;
      if (isMob(entity))continue;
      if (entity === bot.entity) continue
      dist = bot.entity.position.distanceTo(entity.position)
      if ((!best || dist < bestDistance) && dist < 3) {
        best = entity
        bestDistance = dist
      }
    }
    return best
}
module.exports = nearestEntity;