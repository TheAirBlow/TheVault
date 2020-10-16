console.clear()
console.log('\x1b[36m%s\x1b[0m', "-----------------------------------------");
console.log('\x1b[36m%s\x1b[0m', "DoggoMC 1.0.0 by TheAirBlow");
console.log('\x1b[36m%s\x1b[0m', "-----------------------------------------");
console.log('\x1b[33m%s\x1b[0m', "> Starting...");

// MineFlayer and modules
console.log('\x1b[33m%s\x1b[0m', "> Loading MineFlayer and modules...");
const mineflayer = require('mineflayer')
const { pathfinder, Movements } = require('mineflayer-pathfinder')
const { GoalNear, GoalBlock, GoalXZ, GoalY, GoalInvert, GoalFollow } = require('mineflayer-pathfinder').goals
const armorManager = require('mineflayer-armor-manager')
const vec3 = require('vec3').Vec3;
const doggotools = require('./lib')

// Variables
console.log('\x1b[33m%s\x1b[0m', "> Initializating variables...");
global.pathfinding = false
global.killaura = false
global.canAttackSomeone = false
global.currEntity = null
global.stop = false

// Initializate the bot
console.log('\x1b[33m%s\x1b[0m', "> Starting the bot...");
function createBot() {
  bot = mineflayer.createBot({
    host: '0.tcp.ngrok.io',
    port:  13571,
    username: 'DoggoMC',
    version: '1.15.2'
  });
}

createBot()

// Load plugins
console.log('\x1b[33m%s\x1b[0m', "> Starting plugins...");
bot.loadPlugin(pathfinder)
bot.loadPlugin(armorManager);

// Main code
bot.once('spawn', () => {
  setTimeout(() => {bot.chat("/l lollol")}, 1000)
  bot.waitForChunksToLoad(() => {
    console.log('\x1b[32m%s\x1b[0m',`> Logged in as ${bot.username}!`); 
  })
  setInterval(look, 30)
  function look() {
    var entity = doggotools.nearestEntity(bot)
    if (!entity || global.pathfinding) return;
    if (entity.type === 'player') {
      bot.lookAt(entity.position.offset(0, 1.6, 0))
    } else if (entity.type === 'mob'){
      bot.lookAt(entity.position)
    } 
  }
})

bot.on('kicked', (reason) => {
  console.log('\x1b[41m%s\x1b[0m','> Got kicked for: ' + reason)
});

bot.on('end', () => {
  console.log('\x1b[41m%s\x1b[0m',"> Bot has been stopped.");
  createBot()
});

bot.on('death', () => {
  bot.pathfinder.setGoal(null)
  console.log('I dead x.x')
  bot.emit('respawn')
});

bot.on('path_update', (r) => {
    const nodesPerTick = (r.visitedNodes * 50 / r.time).toFixed(2)
    console.log(`I can get there in ${r.path.length} moves. Computation took ${r.time.toFixed(2)} ms (${nodesPerTick} nodes/tick).`)
})

bot.on('goal_reached', (goal) => {
    global.pathfinding = false
})

bot.on('chat', (username, message) => {
    if (!username === "Azm0dan000") return bot.chat("You aren't my mommy!")
    const target = bot.players[username] ? bot.players[username].entity : null
    const mcData = require('minecraft-data')(bot.version)
    const defaultMove = new Movements(bot, mcData)
    const args = message.split(' ');
    const command = args[0]
    console.log(args)
    if (command === "drop") {
      function tossNext() {
        if (bot.inventory.items().length === 0) return bot.chat('Dropped anything.');
        const item = bot.inventory.items()[0]
        bot.tossStack(item, tossNext)
      }
      tossNext()
    } else if (command === "help"){ 
      bot.chat('My commands:')
      setTimeout(() => {
        bot.chat('Pathfinding - goto, follow, come, stop')
        setTimeout(() => {
          bot.chat('Bot Managing - equip, unequip, sword, drop, unequipAll')
          setTimeout(() => {
            bot.chat('Other - killaura, murder, eval')
            setTimeout(() => {
              bot.chat('(C) TheAirBlow 2020')
            }, 500)
          }, 500)
        }, 500)
      }, 500)
    } else if (command === "eval"){ 
      const command = args.join(' ').replace('eval','')
      if (!command) bot.chat('Provide command.')
      try {
      const output = eval(command)
      bot.chat('Output: ' + output)
      } catch(err) {
        bot.chat('Error: ' + err)
      }
    } else if (command === "digLoop") {
      if (!args[1]) return bot.chat('Provide argument: stop/start')
      if (!args[1] === "start" || !args[1] === "stop") return bot.chat('Error: Unknown action ' + args[1])
      function dig() {
        if (!args[2] || !args[3] || !args[4]) return bot.chat('Provide arguments: Coords of block')
        if (global.stop) return bot.chat('Stopped digging')
        var target = bot.blockAt(new vec3(parseInt(args[2], 10), parseInt(args[3], 10), parseInt(args[4], 10)))
        if (target && bot.canDigBlock(target)) {
          bot.dig(target, dig)
        } else {
          bot.pathfinder.setMovements(defaultMove)
          bot.pathfinder.setGoal(new GoalBlock(parseInt(args[2], 10), parseInt(args[3], 10), parseInt(args[4], 10)))
        }
      }
      if (args[1] === "start") { 
        global.stop = false;
        dig();
        bot.chat('Started digging.') 
      } else if (args[1] === "stop") { 
        global.stop = true;
      }
    } else if (command === "unequipAll") {
      var destinations = ['hand', 'off-hand', 'feet', 'legs', 'torso', 'head']
      setTimeout(() => {
        bot.unequip(destinations[0])
        setTimeout(() => {
          bot.unequip(destinations[1])
          setTimeout(() => {
            bot.unequip(destinations[2])
            setTimeout(() => {
              bot.unequip(destinations[3])
              setTimeout(() => {
                bot.unequip(destinations[4])
                setTimeout(() => {
                  bot.unequip(destinations[5])
                  bot.chat('Unequipped anything.');
                }, 200)
              }, 200)
            }, 200)
          }, 200)
        }, 200)
      }, 200)
    } else if (command === "sword") {
      const slots = bot.inventory.slots
      for (var currSlot of slots) {
        if (currSlot == null) continue;
        if (currSlot.name = 'diamond_sword') {
          const item = doggotools.itemByName(bot, currSlot.name)
          bot.updateHeldItem()
          if (bot.heldItem) bot.unequip('hand')
          bot.equip(item, 'hand')
          return;
        }
      }
    } else if (command === "unequip") {
      if (!args[1]) return bot.chat('Provide first argument: Destination')
      var destinations = ['hand', 'off-hand', 'feet', 'legs', 'torso', 'head']
      if (!destinations.includes(args[1])) return bot.chat('Error: Unknown destination')
      bot.chat('Item has been unequipped.')
      bot.unequip('hand')
    } else if (command === "equip") { 
      if (!args[1]) return bot.chat('Provide first argument: Item Name')
      if (!args[2]) return bot.chat('Provide second argument: Destination')
      const item = doggotools.itemByName(bot, args[1])
      if (!item) return bot.chat('Error: That item not in inventory.')
      var destinations = ['hand', 'off-hand', 'feet', 'legs', 'torso', 'head']
      if (!destinations.includes(args[2])) return bot.chat('Error: Unknown destination')
      bot.equip(item, args[2])
      bot.chat('Item has been equipped.')
    } else if (command === "use") {
      bot.chat('Activating item...')
      bot.activateItem()
    } else if (command === 'killaura') {
      if (!global.killaura) {
        bot.chat('Killaura powered on!')
        global.killaura = true
        global.kaInterval = setInterval(killaura, 500)
        function killaura() {
          entity = doggotools.nearestEntity(bot)
          if (entity !== null) {
            bot.attack(entity)
          }
        }
      } else {
        bot.chat('Killaura powered off!')
        global.killaura = false
        clearInterval(global.kaInterval)
      }
    }
    if (command === 'come') {
      if (!target) {
        bot.chat("I don't see you, mommy!")
        return
      }
      const p = target.position
      global.pathfinding = true
      bot.pathfinder.setMovements(defaultMove)
      bot.pathfinder.setGoal(new GoalNear(p.x, p.y, p.z, 1))
    } else if (command.startsWith('goto')) {
      const cmd = message.split(' ')
      if (cmd.length === 4) {
        bot.chat('Pathfinding started.')
        const x = parseInt(cmd[1], 10)
        const y = parseInt(cmd[2], 10)
        const z = parseInt(cmd[3], 10)
        global.pathfinding = true
        bot.pathfinder.setMovements(defaultMove)
        bot.pathfinder.setGoal(new GoalBlock(x, y, z))
      } else if (cmd.length === 3) {
        bot.chat('Pathfinding started.')
        const x = parseInt(cmd[1], 10)
        const z = parseInt(cmd[2], 10)
        global.pathfinding = true
        bot.pathfinder.setMovements(defaultMove)
        bot.pathfinder.setGoal(new GoalXZ(x, z))
      } else if (cmd.length === 2) {
        bot.chat('Pathfinding started.')
        const y = parseInt(cmd[1], 10)
        global.pathfinding = true
        bot.pathfinder.setMovements(defaultMove)
        bot.pathfinder.setGoal(new GoalY(y))
      }
    } else if (command === 'follow') {
      if (!target) {
        bot.chat("I don't see you, mommy!")
        return;
      }
      bot.chat('Following you, mommy')
      global.pathfinding = true
      bot.pathfinder.setMovements(defaultMove)
      bot.pathfinder.setGoal(new GoalFollow(target, 3), true)
    } else if (command === 'stop') {
      global.pathfinding = false
      bot.pathfinder.setGoal(null)
      bot.chat('Stopped pathfinding.')
    } else if (command === 'murder') {
      if (!global.murder) {
        bot.chat('Murderer mode has been activated >:)')
        console.log(bot.inventory)
        global.murder = true
        global.mInterval = setInterval(murder, 500)
        function murder() {
          entity1 = doggotools.nearestEntity(bot)
          entity2 = doggotools.nearestEntityEverywhere(bot)
          if (entity1 !== null) {
            bot.attack(entity1)
          } else {
            if (!entity2) return bot.pathfinder.setGoal(null)
            global.pathfinding = true
            if (!global.currEntity === entity2 || global.currEntity == null) {
              global.currEntity = entity2
              bot.pathfinder.setMovements(defaultMove)
              bot.pathfinder.setGoal(new GoalFollow(global.currEntity))
            }
          }
        }
      } else {
        bot.chat('Murderer mode has been de-activated <:0')
        global.murder = false
        global.pathfinding = false
        bot.pathfinder.setGoal(null)
        clearInterval(global.mInterval)
      }
    }
})

bot.on('error', err => console.log(err))

console.log('\x1b[32m%s\x1b[0m',`> Bot is ready...`); 
