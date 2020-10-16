package net.theairblow.lunarium.module.mods;

import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingSlider;

public class Timer extends Module {

	public Timer() {
		super("Timer", KEY_UNBOUND, Category.WORLD, "more speeds",
				new SettingSlider("Speed", 0.01, 20, 1, 2));
	}

	// See MixinRenderTickCounter for code

}
