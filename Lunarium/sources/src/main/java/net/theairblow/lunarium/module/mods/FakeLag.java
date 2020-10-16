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

import java.util.ArrayList;
import java.util.List;

import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.event.events.EventSendPacket;
import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingMode;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.minecraft.network.packet.c2s.play.PlayerMoveC2SPacket;

public class FakeLag extends Module {

	public List<PlayerMoveC2SPacket> queue = new ArrayList<>();
	public long startTime = 0;

	public FakeLag() {
		super("FakeLag", KEY_UNBOUND, Category.MOVEMENT, "Stores up movement packets",
				new SettingMode("Mode", "Always", "Pulse"),
				new SettingToggle("Limit", false),
				new SettingSlider("Limit", 0, 15, 5, 1),
				new SettingSlider("Pulse", 0, 5, 1, 1));
	}

	@Override
	public void onEnable() {
		startTime = System.currentTimeMillis();
		queue.clear();
		super.onEnable();
	}

	@Override
	public void onDisable() {
		sendPackets();
		super.onDisable();
	}

	@Subscribe
	public void sendPacket(EventSendPacket event) {
		if (!(event.getPacket() instanceof PlayerMoveC2SPacket
				|| event.getPacket() instanceof PlayerMoveC2SPacket.PositionOnly
				|| event.getPacket() instanceof PlayerMoveC2SPacket.LookOnly
				|| event.getPacket() instanceof PlayerMoveC2SPacket.Both))
			return;
		queue.add((PlayerMoveC2SPacket) event.getPacket());
		event.setCancelled(true);
	}

	@Subscribe
	public void onTick(EventTick event) {
		if (getSetting(0).asMode().mode == 0) {
			if (getSetting(1).asToggle().state &&
					System.currentTimeMillis() - startTime > getSetting(2).asSlider().getValue() * 1000)
				setToggled(false);
		} else if (getSetting(0).asMode().mode == 1) {
			if (System.currentTimeMillis() - startTime > getSetting(3).asSlider().getValue() * 1000) {
				setToggled(false);
				setToggled(true);
			}
		}
	}

	public void sendPackets() {
		for (PlayerMoveC2SPacket p : new ArrayList<>(queue)) {
			if (p instanceof PlayerMoveC2SPacket.LookOnly)
				continue;
			mc.player.networkHandler.sendPacket(p);
		}
		queue.clear();
	}
}
