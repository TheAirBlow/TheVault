const isFood = function(id) {
    if (!id) {
        throw new Error("ID isn't provided!")
    }
    var foodIDs = ['260', '282', '297', '319', '0320', '322', '322:1', '349', '349:1', '349:2', '350', '350:1', '357', '360', '363', '364', '365', '366', '391', '392', '393', '396', '400', '411', '412', '413', '423', '424', '436']
    if (foodIDs.includes(id)) {
        return true;
    } else {
        return false;
    }
}
module.exports = isFood;
