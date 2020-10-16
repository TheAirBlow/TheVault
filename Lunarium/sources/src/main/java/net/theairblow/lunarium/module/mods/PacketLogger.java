package net.theairblow.lunarium.module.mods;

import net.theairblow.lunarium.event.events.EventSendPacket;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.utils.BleachLogger;
import net.theairblow.lunarium.utils.ConsoleLogger;

import com.google.common.eventbus.Subscribe;

public class PacketLogger extends Module {
	public PacketLogger() {
        super("Test", KEY_UNBOUND, Category.WORLD, "Logs all packets sended to you");
    }

    @Subscribe
    public void onSendPacket(EventSendPacket event) {
        ConsoleLogger.infoMessageConsole("Packet " + event.getPacket().toString() + " received");
        BleachLogger.infoMessage("Packet " + event.getPacket().toString() + " received");
    }
}
