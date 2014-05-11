
crypto = require("crypto");

exports.generate = (text) ->
  sha256 = crypto.createHash("sha256");
  sha256.update text, "utf8"
  sha256.digest("base64")
