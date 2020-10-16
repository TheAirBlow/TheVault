/*
 * This file is part of the LunariumClient distribution (https://github.com/TheAirBlow/LunariumClient).
 * Copyright (c) 2020 TheAirBlow .
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.theairblow.lunarium.module.mods;

import org.lwjgl.glfw.GLFW;

import net.theairblow.lunarium.gui.clickgui.ClickGuiScreen;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;

public class ClickGui extends Module {

	public static ClickGuiScreen clickGui = new ClickGuiScreen();

	public ClickGui() {
		super("ClickGui", GLFW.GLFW_KEY_RIGHT_SHIFT, Category.RENDER, "Draws the clickgui",
				new SettingSlider("Length", 70, 85, 70, 0),
				new SettingToggle("Search bar", false),
				new SettingToggle("Help", true));
	}

	public void onEnable() {
		mc.openScreen(clickGui);
		setToggled(false);
	}
}
