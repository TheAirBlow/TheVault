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
package net.theairblow.lunarium.command.commands;

import net.theairblow.lunarium.command.Command;
import net.theairblow.lunarium.utils.BleachLogger;
import net.minecraft.item.ItemStack;
import net.minecraft.text.LiteralText;

public class CmdRename extends Command {

	@Override
	public String getAlias() {
		return "rename";
	}

	@Override
	public String getDescription() {
		return "Renames an item, use \"&\" for color";
	}

	@Override
	public String getSyntax() {
		return "rename [name]";
	}

	@Override
	public void onCommand(String command, String[] args) throws Exception {
		if (!mc.player.abilities.creativeMode) {
			BleachLogger.errorMessage("Not In Creative Mode!");
			return;
		}

		ItemStack i = mc.player.inventory.getMainHandStack();

		String name = "";
		for (int j = 0; j < args.length; j++)
			name += args[j] += " ";

		i.setCustomName(new LiteralText(name.replace("&", "\u00a7").replace("\u00a7\u00a7", "&")));
		BleachLogger.infoMessage("Renamed Item");
	}

}
