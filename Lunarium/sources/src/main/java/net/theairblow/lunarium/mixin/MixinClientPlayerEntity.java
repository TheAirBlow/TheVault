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
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.Redirect;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import com.mojang.authlib.GameProfile;

import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.event.events.EventClientMove;
import net.theairblow.lunarium.event.events.EventMovementTick;
import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.ModuleManager;
import net.theairblow.lunarium.module.mods.BetterPortal;
import net.theairblow.lunarium.module.mods.Freecam;
import net.theairblow.lunarium.module.mods.NoSlow;
import net.theairblow.lunarium.module.mods.SafeWalk;
import net.theairblow.lunarium.module.mods.Scaffold;
import net.theairblow.lunarium.utils.BleachQueue;
import net.theairblow.lunarium.utils.file.BleachFileHelper;
import net.minecraft.client.MinecraftClient;
import net.minecraft.client.gui.screen.Screen;
import net.minecraft.client.network.AbstractClientPlayerEntity;
import net.minecraft.client.network.ClientPlayerEntity;
import net.minecraft.client.world.ClientWorld;
import net.minecraft.entity.MovementType;
import net.minecraft.util.math.Vec3d;

@Mixin(ClientPlayerEntity.class)
public class MixinClientPlayerEntity extends AbstractClientPlayerEntity {

	public MixinClientPlayerEntity(ClientWorld world, GameProfile profile) {
		super(world, profile);
	}

	@Shadow
	protected MinecraftClient client;

	@Shadow
	protected void autoJump(float float_1, float float_2) {
	}

	@Inject(at = @At("RETURN"), method = "tick()V", cancellable = true)
	public void tick(CallbackInfo info) {
		try {
			if (MinecraftClient.getInstance().player.age % 100 == 0) {
				if (BleachFileHelper.SCHEDULE_SAVE_MODULES)
					BleachFileHelper.saveModules();
				if (BleachFileHelper.SCHEDULE_SAVE_CLICKGUI)
					BleachFileHelper.saveClickGui();
				if (BleachFileHelper.SCHEDULE_SAVE_FRIENDS)
					BleachFileHelper.saveFriends();
			}

			BleachQueue.nextQueue();
		} catch (Exception e) {
		}

		EventTick event = new EventTick();
		LunariumClient.eventBus.post(event);
		if (event.isCancelled())
			info.cancel();
	}

	@Inject(at = @At("HEAD"), method = "sendMovementPackets()V", cancellable = true)
	public void sendMovementPackets(CallbackInfo info) {
		EventMovementTick event = new EventMovementTick();
		LunariumClient.eventBus.post(event);
		if (event.isCancelled())
			info.cancel();
	}

	@Redirect(method = "tickMovement()V", at = @At(value = "INVOKE", target = "Lnet/minecraft/client/network/ClientPlayerEntity;isUsingItem()Z"))
	private boolean tickMovement_isUsingItem(ClientPlayerEntity player) {
		if (ModuleManager.getModule(NoSlow.class).isToggled() && ModuleManager.getModule(NoSlow.class).getSetting(5).asToggle().state) {
			return false;
		}

		return player.isUsingItem();
	}

	@Inject(at = @At("HEAD"), method = "move", cancellable = true)
	public void move(MovementType movementType_1, Vec3d vec3d_1, CallbackInfo info) {
		EventClientMove event = new EventClientMove(movementType_1, vec3d_1);
		LunariumClient.eventBus.post(event);
		if (event.isCancelled()) {
			info.cancel();
		} else if (!movementType_1.equals(event.type) || !vec3d_1.equals(event.vec3d)) {
			double double_1 = this.getX();
			double double_2 = this.getZ();
			super.move(event.type, event.vec3d);
			this.autoJump((float) (this.getX() - double_1), (float) (this.getZ() - double_2));
			info.cancel();
		}
	}

	@Inject(at = @At("HEAD"), method = "method_30673", cancellable = true)
	protected void method_30673(double double_1, double double_2, CallbackInfo ci) {
		if (ModuleManager.getModule(Freecam.class).isToggled()) {
			ci.cancel();
		}
	}

	@Redirect(method = "updateNausea()V", at = @At(value = "INVOKE", target = "Lnet/minecraft/client/network/ClientPlayerEntity;closeHandledScreen()V", ordinal = 0))
	private void updateNausea_closeHandledScreen(ClientPlayerEntity player) {
		if (!ModuleManager.getModule(BetterPortal.class).isToggled() || !ModuleManager.getModule(BetterPortal.class).getSetting(0).asToggle().state) {
			closeHandledScreen();
		}
	}

	@Redirect(method = "updateNausea()V", at = @At(value = "INVOKE", target = "Lnet/minecraft/client/MinecraftClient;openScreen(Lnet/minecraft/client/gui/screen/Screen;)V", ordinal = 0))
	private void updateNausea_openScreen(MinecraftClient player, Screen screen_1) {
		if (!ModuleManager.getModule(BetterPortal.class).isToggled() || !ModuleManager.getModule(BetterPortal.class).getSetting(0).asToggle().state) {
			client.openScreen(screen_1);
		}
	}

	@Override
	protected boolean clipAtLedge() {
		return super.clipAtLedge() || ModuleManager.getModule(SafeWalk.class).isToggled()
				|| (ModuleManager.getModule(Scaffold.class).isToggled() && ModuleManager.getModule(Scaffold.class).getSetting(3).asToggle().state);
	}
}
