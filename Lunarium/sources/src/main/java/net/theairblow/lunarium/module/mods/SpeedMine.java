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

import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingMode;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.minecraft.entity.effect.StatusEffectInstance;
import net.minecraft.entity.effect.StatusEffects;

public class SpeedMine extends Module {

	public SpeedMine() {
		super("SpeedMine", KEY_UNBOUND, Category.EXPLOITS, "Allows you to mine at sanic speeds",
				new SettingMode("Mode", "Haste", "OG"),
				new SettingSlider("Haste Lvl", 1, 3, 1, 0),
				new SettingSlider("Cooldown", 0, 4, 1, 0),
				new SettingSlider("Multiplier", 1, 3, 1.3, 1),
				new SettingToggle("AntiFatigue", true),
				new SettingToggle("AntiOffGround", true));
	}

	@Override
	public void onDisable() {
		super.onDisable();
		mc.player.removeStatusEffect(StatusEffects.HASTE);
	}

	@Subscribe
	public void onTick(EventTick event) {
		if (this.getSetting(0).asMode().mode == 0) {
			mc.player.addStatusEffect(new StatusEffectInstance(StatusEffects.HASTE, 1, (int) getSetting(1).asSlider().getValue() - 1));
		}
	}
}
