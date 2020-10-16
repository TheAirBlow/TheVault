/*
 * This file is part of the LunariumClient distribution (https://github.com/TheAirBlow/LunariumClient).
 * Copyright (c) 2020 TheAirBlow.
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
package net.theairblow.lunarium.rpc;

import net.arikia.dev.drpc.DiscordEventHandlers;
import net.arikia.dev.drpc.DiscordRPC;
import net.arikia.dev.drpc.DiscordRichPresence;
import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.utils.ConsoleLogger;

public class RichPresense {
	private static final String clientid = "748083260889890866";

	public static void start() {
		DiscordRPC.discordInitialize(clientid, new DiscordEventHandlers.Builder().setReadyEventHandler(user -> {
			ConsoleLogger.infoMessageConsole("Welcome " + user.username + "#" + user.discriminator + "!");
		}).build(), true);
		
		DiscordRichPresence rich = new DiscordRichPresence.Builder("Lunarium " + LunariumClient.VERSION).setDetails("Gaming hack").setBigImage("doggo", "bruh moment").build();
		DiscordRPC.discordUpdatePresence(rich);
	}

	public static void stop() {
		DiscordRPC.discordShutdown();
	}
}