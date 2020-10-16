package net.theairblow.lunarium.setting.other;

import net.theairblow.lunarium.setting.base.SettingMode;
import net.theairblow.lunarium.setting.base.SettingToggle;

public class SettingRotate extends SettingToggle {

	public SettingRotate(boolean state) {
		super("Rotate", state);
		children.add(new SettingMode("Mode", "Server", "Client").withDesc("How to rotate"));
	}

	public int getRotateMode() {
		return getChild(0).asMode().mode;
	}
}
