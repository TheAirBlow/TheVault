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

import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.minecraft.util.Util;

public class StarGithub extends Module {

	public StarGithub() {
		super("StarGithub", KEY_UNBOUND, Category.MISC, "i need to feed my 420 children pls star github");
	}

	public void onEnable() {
		try {
			Util.getOperatingSystem().open("https://github.com/BleachDrinker420/LunariumClient-1.14");
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.setToggled(false);
	}
}
