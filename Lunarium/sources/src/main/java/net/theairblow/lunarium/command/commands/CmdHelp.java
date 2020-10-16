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
import net.theairblow.lunarium.command.CommandManager;
import net.theairblow.lunarium.utils.BleachLogger;
import net.minecraft.text.HoverEvent;
import net.minecraft.text.LiteralText;

public class CmdHelp extends Command {

	@Override
	public String getAlias() {
		return "help";
	}

	@Override
	public String getDescription() {
		return "Displays all the commands";
	}

	@Override
	public String getSyntax() {
		return "help | help [Command]";
	}

	@Override
	public void onCommand(String command, String[] args) throws Exception {
		String cmd = null;
		try {
			cmd = args[0];
		} catch (Exception e) {
		}

		for (Command c : CommandManager.getCommands()) {
			if (!cmd.isEmpty() && !cmd.equalsIgnoreCase(c.getAlias()))
				continue;

			LiteralText text = new LiteralText("\u00a72" + Command.PREFIX + c.getAlias() + " ->\u00a7a " + c.getSyntax());
			text.setStyle(text.getStyle().withHoverEvent(
					new HoverEvent(HoverEvent.Action.SHOW_TEXT, new LiteralText(
							"\u00a7a" + Command.PREFIX + c.getAlias() + "\n\u00a72" + c.getSyntax() + "\n\u00a7a" + c.getDescription()))));
			BleachLogger.noPrefixMessage(text);
		}
	}

}
