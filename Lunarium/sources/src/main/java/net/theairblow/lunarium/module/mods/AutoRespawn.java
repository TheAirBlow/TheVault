package net.theairblow.lunarium.module.mods;

import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.event.events.EventOpenScreen;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.theairblow.lunarium.utils.BleachQueue;
import net.minecraft.client.gui.screen.DeathScreen;

public class AutoRespawn extends Module {

	public AutoRespawn() {
		super("AutoRespawn", KEY_UNBOUND, Category.PLAYER, "Automatically respawn when you die",
				new SettingToggle("Delay", false),
				new SettingSlider("Delay", 1, 15, 5, 0));
	}

	@Subscribe
	public void onOpenScreen(EventOpenScreen event) {
		if (event.getScreen() instanceof DeathScreen) {
			if (getSetting(0).asToggle().state) {
				for (int i = 0; i <= (int) getSetting(1).asSlider().getValue(); i++)
					BleachQueue.add("autorespawn", () -> {
					});
				BleachQueue.add("autorespawn", () -> mc.player.requestRespawn());
			} else {
				mc.player.requestRespawn();
			}
		}
	}
}
