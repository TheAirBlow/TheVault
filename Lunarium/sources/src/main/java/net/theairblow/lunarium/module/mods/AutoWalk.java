package net.theairblow.lunarium.module.mods;

import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;

public class AutoWalk extends Module {

	public AutoWalk() {
		super("AutoWalk", KEY_UNBOUND, Category.MOVEMENT, "Automatically walks/flies forward");
	}

	public void onDisable() {
		mc.options.keyForward.setPressed(false);
		super.onDisable();
	}

	@Subscribe
	public void onTick(EventTick event) {
		mc.options.keyForward.setPressed(true);
	}
}
