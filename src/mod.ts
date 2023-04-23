import { DependencyContainer } from "tsyringe";
import { IPreAkiLoadMod } from "@spt-aki/models/external/IPreAkiLoadMod";
import { ILogger } from "@spt-aki/models/spt/utils/ILogger";
import { LogTextColor } from "@spt-aki/models/spt/logging/LogTextColor";
import { LogBackgroundColor } from "@spt-aki/models/spt/logging/LogBackgroundColor";

class Mod implements IPreAkiLoadMod
{
    preAkiLoad(container: DependencyContainer): void 
    {
        // get the logger from the server container
        const logger = container.resolve<ILogger>("WinstonLogger");
        
        logger.logWithColor("Saru's StartScript has been loaded. Nothing about your game will change.", LogTextColor.BLACK, LogBackgroundColor.WHITE);
    }
}

module.exports = { mod: new Mod() }

//  yes, this is a template mod. the only purpose this serves is to hide the errors in the console on startup.