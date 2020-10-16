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
package net.theairblow.lunarium.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import net.theairblow.lunarium.gui.BleachMainMenu;
import net.theairblow.lunarium.utils.file.BleachFileHelper;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.gui.screen.TitleScreen;
import net.minecraft.client.gui.widget.ButtonWidget;
import net.minecraft.text.LiteralText;
import net.minecraft.text.Text;

@Mixin(TitleScreen.class)
public class MixinTitleScreen extends Screen {
	private static String openWindow = "";

	protected MixinTitleScreen(Text text_1) {
		super(text_1);
	}
	

	@Inject(at = @At("HEAD"), method = "init()V")
	private void init(CallbackInfo info) {
		if (BleachMainMenu.customTitleScreen) {
			MinecraftClient.getInstance().openScreen(new BleachMainMenu());
			switch(openWindow) {
				case "LoginManager": {
					MixinTitleScreen.openWindow = "";
					BleachMainMenu.windows.get(1).closed = false;
					BleachMainMenu.selectWindow(1);
					break;
				}
			}
		} else {
			addButton(new ButtonWidget(width / 2 - 124, height / 4 + 96, 20, 20, new LiteralText("BH"), button -> {
				BleachMainMenu.customTitleScreen = !BleachMainMenu.customTitleScreen;
				BleachFileHelper.saveMiscSetting("customTitleScreen", "true");
				client.openScreen(new TitleScreen(true));
			}));
			addButton(new ButtonWidget(width / 2 + 104, height / 4 + 96, 20, 20, new LiteralText("LM"), button -> {
				MixinTitleScreen.openWindow = "LoginManager";
				BleachMainMenu.customTitleScreen = !BleachMainMenu.customTitleScreen;
				BleachFileHelper.saveMiscSetting("customTitleScreen", "true");
				client.openScreen(new TitleScreen(true));
			}));
		}
	}
}
