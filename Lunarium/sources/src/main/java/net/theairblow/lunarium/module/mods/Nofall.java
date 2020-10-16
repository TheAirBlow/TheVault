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
import net.minecraft.block.Blocks;
import net.minecraft.network.packet.c2s.play.PlayerMoveC2SPacket;

public class Nofall extends Module {

	public Nofall() {
		super("Nofall", KEY_UNBOUND, Category.PLAYER, "Prevents you from taking fall damage.",
				new SettingMode("Mode", "Simple", "Packet"));
	}

	@Subscribe
	public void onTick(EventTick event) {
		if (mc.player.fallDistance > 2f && getSetting(0).asMode().mode == 0) {
			if (mc.player.isFallFlying())
				return;
			mc.player.networkHandler.sendPacket(new PlayerMoveC2SPacket(true));
		}

		if (mc.player.fallDistance > 2f && getSetting(0).asMode().mode == 1 &&
				mc.world.getBlockState(mc.player.getBlockPos().add(
						0, -1.5 + (mc.player.getVelocity().y * 0.1), 0)).getBlock() != Blocks.AIR) {
			mc.player.networkHandler.sendPacket(new PlayerMoveC2SPacket(false));
			mc.player.networkHandler.sendPacket(new PlayerMoveC2SPacket.PositionOnly(
					mc.player.getX(), mc.player.getY() - 420.69, mc.player.getZ(), true));
			mc.player.fallDistance = 0;
		}
	}

}
