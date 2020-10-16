const itemByName = function(bot, name) {
    if (!bot) {
        throw new Error("Bot instance isn't provided!")
    }
    if (!name) {
        throw new Error("Item name isn't provided!")
    }
    return bot.inventory.items().filter(item => item.name === name)[0]
}
module.exports = itemByName;