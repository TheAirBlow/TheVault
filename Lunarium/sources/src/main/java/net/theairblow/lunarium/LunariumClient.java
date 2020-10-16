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
package net.theairblow.lunarium;

import com.google.common.eventbus.EventBus;

import net.theairblow.lunarium.gui.BleachMainMenu;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.module.ModuleManager;
import net.theairblow.lunarium.module.mods.ClickGui;
import net.theairblow.lunarium.rpc.RichPresense;
import net.theairblow.lunarium.utils.FriendManager;
import net.theairblow.lunarium.utils.TaskManager;
import net.theairblow.lunarium.utils.file.BleachFileHelper;
import net.theairblow.lunarium.utils.file.BleachFileMang;
import net.fabricmc.api.ModInitializer;
import net.minecraft.client.MinecraftClient;
import net.theairblow.lunarium.utils.ConsoleLogger;

public class LunariumClient implements ModInitializer {

	public static final String VERSION = "B1.2";
	public static final int INTVERSION = 3;

	public static EventBus eventBus = new EventBus();

	public static FriendManager friendMang;

	@Override
	public void onInitialize() {
		ConsoleLogger.infoMessageConsole("Loading Lunarium Client...");
		TaskManager.addTask("Set custom title");
		TaskManager.addTask("Init FileHelper");
		TaskManager.addTask("Start DiscordRPC");
		TaskManager.addTask("Load ClickGUI windows");
		TaskManager.addTask("Load ClickGUI settings");
		TaskManager.addTask("Load cheats settings");
		TaskManager.addTask("Load Keybind system");
		TaskManager.addTask("Load custom GUI setting");
		MinecraftClient.getInstance().execute(this::updateTitle);
		TaskManager.endTask("Set custom title");
		BleachFileMang.init();
		BleachFileHelper.readModules();
		TaskManager.endTask("Init FileHelper");
		RichPresense.start();
		TaskManager.endTask("Start DiscordRPC");

		ClickGui.clickGui.initWindows();
		TaskManager.endTask("Load ClickGUI windows");
		BleachFileHelper.readClickGui();
		BleachFileHelper.readPrefix();
		BleachFileHelper.readFriends();
		TaskManager.endTask("Load ClickGUI settings");

		for (Module m : ModuleManager.getModules())
			m.init();
		
		TaskManager.endTask("Load cheats settings");

		eventBus.register(new ModuleManager());
		TaskManager.endTask("Load Keybind system");

		String mainMenu = BleachFileHelper.readMiscSetting("customTitleScreen");
		if (mainMenu != null && mainMenu.equalsIgnoreCase("false")) {
			BleachMainMenu.customTitleScreen = false;
		}
		TaskManager.endTask("Load custom GUI setting");
		ConsoleLogger.infoMessageConsole("Loaded Lunarium Client succesfully!");
	}
	
	private void updateTitle() {
		MinecraftClient.getInstance().getWindow().setTitle("Lunarium Client " + LunariumClient.VERSION);
	}
	
	public MinecraftClient getMinecraftInstance() {
		MinecraftClient instance = MinecraftClient.getInstance();
		return instance;
	}
}
