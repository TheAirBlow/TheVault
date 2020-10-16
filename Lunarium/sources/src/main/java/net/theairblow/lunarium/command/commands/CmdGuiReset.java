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
import net.theairblow.lunarium.module.mods.ClickGui;
import net.theairblow.lunarium.utils.BleachLogger;

public class CmdGuiReset extends Command {

	@Override
	public String getAlias() {
		return "guireset";
	}

	@Override
	public String getDescription() {
		return "Resets the clickgui windows";
	}

	@Override
	public String getSyntax() {
		return "guireset";
	}

	@Override
	public void onCommand(String command, String[] args) throws Exception {
		ClickGui.clickGui.resetGui();
		BleachLogger.infoMessage("Reset the clickgui!");
	}

}
