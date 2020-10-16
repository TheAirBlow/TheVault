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

import java.util.Set;

import org.lwjgl.glfw.GLFW;

import com.google.common.collect.Sets;
import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingMode;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.theairblow.lunarium.utils.FabricReflect;
import net.minecraft.item.Item;
import net.minecraft.item.Items;

public class FastUse extends Module {

	private static final Set<Item> THROWABLE = Sets.newHashSet(
			Items.SNOWBALL, Items.EGG, Items.EXPERIENCE_BOTTLE,
			Items.ENDER_EYE, Items.ENDER_PEARL, Items.SPLASH_POTION, Items.LINGERING_POTION);

	public FastUse() {
		super("FastUse", GLFW.GLFW_KEY_B, Category.PLAYER, "Allows you to use items faster",
				new SettingMode("Mode", "Single", "Multi"),
				new SettingSlider("Multi", 1, 100, 20, 0),
				new SettingToggle("Throwables Only", true),
				new SettingToggle("XP Only", false));
	}

	@Subscribe
	public void onTick(EventTick event) {
		if ((getSetting(2).asToggle().state && !THROWABLE.contains(mc.player.getMainHandStack().getItem()))
				|| (getSetting(3).asToggle().state && mc.player.getMainHandStack().getItem() != Items.EXPERIENCE_BOTTLE)) {
			return;
		}

		/* set rightClickDelay to 0 */
		FabricReflect.writeField(mc, 0, "field_1752", "itemUseCooldown");

		/* call rightClickMouse */
		if (getSetting(0).asMode().mode == 1 && mc.options.keyUse.isPressed()) {
			for (int i = 0; i < (int) getSetting(1).asSlider().getValue(); i++) {
				FabricReflect.invokeMethod(mc, "method_1583", "doItemUse");
			}
		}
	}
}
