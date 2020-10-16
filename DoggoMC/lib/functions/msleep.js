const msleep = function(s) {
    Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, s);
}
module.exports = msleep;