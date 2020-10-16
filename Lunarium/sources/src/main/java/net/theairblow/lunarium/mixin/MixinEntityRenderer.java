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

import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.event.events.EventEntityRender;
import net.minecraft.client.render.VertexConsumerProvider;
import net.minecraft.client.render.entity.EntityRenderer;
import net.minecraft.client.util.math.MatrixStack;
import net.minecraft.entity.Entity;
import net.minecraft.text.Text;

@Mixin(EntityRenderer.class)
public abstract class MixinEntityRenderer<T extends Entity> {

	@Inject(at = @At("HEAD"), method = "render", cancellable = true)
	public void render(T entity_1, float float_1, float float_2, MatrixStack matrixStack_1, VertexConsumerProvider vertexConsumerProvider_1, int int_1,
			CallbackInfo info) {
		EventEntityRender.Render event = new EventEntityRender.Render(entity_1);
		LunariumClient.eventBus.post(event);
		if (event.isCancelled())
			info.cancel();
	}

	@Inject(at = @At("HEAD"), method = "renderLabelIfPresent", cancellable = true)
	public void renderLabelIfPresent(T entity_1, Text text_1, MatrixStack matrixStack_1, VertexConsumerProvider vertexConsumerProvider_1, int int_1, CallbackInfo info) {
		EventEntityRender.Label event = new EventEntityRender.Label(entity_1);
		LunariumClient.eventBus.post(event);
		if (event.isCancelled())
			info.cancel();
	}
}
