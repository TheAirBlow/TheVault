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

import net.theairblow.lunarium.event.events.EventClientMove;
import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.module.ModuleManager;
import net.theairblow.lunarium.setting.base.SettingMode;
import net.theairblow.lunarium.setting.base.SettingSlider;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.minecraft.network.packet.c2s.play.ClientCommandC2SPacket;
import net.minecraft.network.packet.c2s.play.ClientCommandC2SPacket.Mode;
import net.minecraft.util.math.Vec3d;

public class ElytraFly extends Module {
	
	private boolean activatedBefore = false;
	private boolean obj;

	public ElytraFly() {
        super("ElytraFly", KEY_UNBOUND, Category.MOVEMENT, "Improves the elytra",
                new SettingToggle("Auto Flight", true).withDesc("Automatically open elytra"),
                new SettingMode("Mode", "Normal", "Control"),
                new SettingSlider("Speed", 0, 5, 2.49, 2),
                new SettingToggle("Downwards Velocity", false),
                new SettingToggle("AutoElytra", false).withDesc("Equip elytra on start and equips armor on disable"));
    }
	
	public void onEnable() {
		if (!Boolean.parseBoolean(this.getSetting(4).asToggle().toString())) return;
		if (!ModuleManager.getModule(AutoArmor.class).isToggled()) {
            ModuleManager.getModule(AutoArmor.class).toggle();
        } else {
        	activatedBefore = true;
        }
		ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state = Boolean.TRUE;
		if (activatedBefore) {
			activatedBefore = false;
		} else {
			ModuleManager.getModule(AutoArmor.class).toggle();
		}
	}
	
	public void onDisable() {
		if (!Boolean.parseBoolean(this.getSetting(4).asToggle().toString())) return;
		if (!ModuleManager.getModule(AutoArmor.class).isToggled()) {
            ModuleManager.getModule(AutoArmor.class).toggle();
        } else {
        	activatedBefore = true;
        }
		ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state = Boolean.FALSE;
		if (activatedBefore) {
			activatedBefore = obj;
		} else {
			ModuleManager.getModule(AutoArmor.class).toggle();
		}
	}
	
	/* if (!ModuleManager.getModule(AutoArmor.class).isToggled()) {
            ModuleManager.getModule(AutoArmor.class).toggle();
        }
        if (ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state == Boolean.TRUE) {
            ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state = Boolean.FALSE;
        } else if (ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state == Boolean.FALSE) {
            ModuleManager.getModule(AutoArmor.class).getSetting(1).asToggle().state = Boolean.TRUE;
        } */

    @Subscribe
    public void onClientMove(EventClientMove event) {
        if (getSetting(1).asMode().mode == 1 && mc.player.isFallFlying()) {
            if (!mc.options.keyJump.isPressed() && !mc.options.keySneak.isPressed()) {
                if (getSetting(3).asToggle().state) {
                    event.vec3d = new Vec3d(event.vec3d.x, -0.0001, event.vec3d.z);
                } else {
                    event.vec3d = new Vec3d(event.vec3d.x, 0, event.vec3d.z);
                }
            }

            if (!mc.options.keyBack.isPressed() && !mc.options.keyLeft.isPressed()
                    && !mc.options.keyRight.isPressed() && !mc.options.keyForward.isPressed()) {
                if (getSetting(3).asToggle().state) {
                    event.vec3d = new Vec3d(0, event.vec3d.y-0.0001, 0);
                } else {
                    event.vec3d = new Vec3d(0, event.vec3d.y, 0);
                }
            }
        }
    }

    @Subscribe
    public void onTick(EventTick event) {
        assert mc.world != null;
        Vec3d vec3d = new Vec3d(0, 0, getSetting(2).asSlider().getValue()).rotateX(getSetting(1).asMode().mode == 1 ? 0 : -(float) Math.toRadians(mc.player.pitch)).rotateY(-(float) Math.toRadians(mc.player.yaw));
        if (!mc.player.isFallFlying() && !mc.player.isOnGround() && getSetting(1).asMode().mode == 1 && mc.player.age % 10 == 0 && getSetting(0).asToggle().state) {
                mc.player.networkHandler.sendPacket(new ClientCommandC2SPacket(mc.player, Mode.START_FALL_FLYING));
        }
        if (mc.player.isFallFlying()) {
            if (getSetting(1).asMode().mode == 0 && mc.options.keyForward.isPressed()) {
                mc.player.setVelocity(
                        mc.player.getVelocity().x + vec3d.x + (vec3d.x - mc.player.getVelocity().x),
                        mc.player.getVelocity().y + vec3d.y + (vec3d.y - mc.player.getVelocity().y),
                        mc.player.getVelocity().z + vec3d.z + (vec3d.z - mc.player.getVelocity().z));
            } else if (getSetting(1).asMode().mode == 1) {
                if (mc.options.keyBack.isPressed()) vec3d = vec3d.multiply(-1);
                if (mc.options.keyLeft.isPressed()) vec3d = vec3d.rotateY((float) Math.toRadians(90));
                if (mc.options.keyRight.isPressed()) vec3d = vec3d.rotateY(-(float) Math.toRadians(90));

                if (mc.options.keyJump.isPressed()) vec3d = vec3d.add(0, getSetting(2).asSlider().getValue(), 0);
                if (mc.options.keySneak.isPressed()) vec3d = vec3d.add(0, -getSetting(2).asSlider().getValue(), 0);

                if (!mc.options.keyBack.isPressed() && !mc.options.keyLeft.isPressed()
                        && !mc.options.keyRight.isPressed() && !mc.options.keyForward.isPressed()
                        && !mc.options.keyJump.isPressed() && !mc.options.keySneak.isPressed()) vec3d = Vec3d.ZERO;
                mc.player.setVelocity(vec3d.multiply(2));
            }
        }
    }
}
