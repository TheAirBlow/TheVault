package net.theairblow.lunarium.module.mods;

import java.util.Optional;

import org.lwjgl.glfw.GLFW;

import com.google.common.eventbus.Subscribe;

import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingMode;
import net.minecraft.client.render.debug.DebugRenderer;
import net.minecraft.entity.Entity;
import net.minecraft.entity.player.PlayerEntity;

public class MouseFriend extends Module {

	private boolean antiSpamClick = false;

	public MouseFriend() {
		super("MouseFriend", KEY_UNBOUND, Category.MISC, "Add/Remove friends with mouse buttons",
				new SettingMode("Button", "Middle", "Right", "MOUSE4", "MOUSE5", "MOUSE6"));
	}

	@Subscribe
	public void onTick(EventTick event) {
		int setting = getSetting(0).asMode().mode;
		int button = setting == 0 ? GLFW.GLFW_MOUSE_BUTTON_MIDDLE : setting == 1 ? GLFW.GLFW_MOUSE_BUTTON_RIGHT : setting + 2;

		if (GLFW.glfwGetMouseButton(mc.getWindow().getHandle(), button) == 1 && !antiSpamClick) {
			antiSpamClick = true;

			Optional<Entity> lookingAt = DebugRenderer.getTargetedEntity(mc.player, 200);

			if (lookingAt.isPresent()) {
				Entity e = lookingAt.get();

				if (e instanceof PlayerEntity) {
					if (LunariumClient.friendMang.has(e.getName().asString())) {
						LunariumClient.friendMang.remove(e.getName().asString());
					} else {
						LunariumClient.friendMang.add(e.getName().asString());
					}
				}
			}
		} else if (GLFW.glfwGetMouseButton(mc.getWindow().getHandle(), button) == 0) {
			antiSpamClick = false;
		}
	}
}
