"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const LogTextColor_1 = require("C:/snapshot/project/obj/models/spt/logging/LogTextColor");
const LogBackgroundColor_1 = require("C:/snapshot/project/obj/models/spt/logging/LogBackgroundColor");
class Mod {
    preAkiLoad(container) {
        // get the logger from the server container
        const logger = container.resolve("WinstonLogger");
        logger.logWithColor("Saru's StartScript has been loaded. Nothing about your game will change.", LogTextColor_1.LogTextColor.BLACK, LogBackgroundColor_1.LogBackgroundColor.WHITE);
    }
}
module.exports = { mod: new Mod() };
//  yes, this is a template mod. the only purpose this serves is to hide the errors in the console on startup.
