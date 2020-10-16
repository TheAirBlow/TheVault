package net.theairblow.lunarium.module.mods;

import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.event.events.EventWorldRenderEntity;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.setting.base.SettingColor;
import net.theairblow.lunarium.setting.base.SettingToggle;
import net.theairblow.lunarium.utils.BleachLogger;
import net.theairblow.lunarium.utils.RenderUtils;
import com.google.common.eventbus.Subscribe;
import net.minecraft.client.render.BufferBuilderStorage;
import net.minecraft.client.render.OutlineVertexConsumerProvider;
import net.minecraft.client.render.VertexConsumerProvider;
import net.minecraft.entity.player.PlayerEntity;

public class LogoutSpots extends Module {
	public LogoutSpots() {
        super("LogoutSpots", KEY_UNBOUND, Category.RENDER, "Draws box where player logged out",
                new SettingColor("Player Color", 1f, 0.0f, 0.0f, false).withDesc("Logout spot color for players"),
                new SettingToggle("Chat Log", false).withDesc("Send coords of logged out players")
        );
    }

    @Subscribe
    public void onWorldEntityRender(EventWorldRenderEntity event) {
        if (event.entity instanceof PlayerEntity && event.entity != mc.player && this.isToggled()) {
            if (!LunariumClient.friendMang.has(event.entity.getName().asString())) {
                float[] col = getSetting(0).asColor().getRGBFloat();
                event.vertex = getOutline(event.buffers, col[0], col[1], col[2]);
                RenderUtils.drawOutlineBox(event.entity.getBoundingBox(), col[0], col[1], col[2], 1f);
                if (Boolean.parseBoolean(this.getSetting(1).asToggle().toString())) {
                	BleachLogger.infoMessage("LogoutSpots: " + event.entity.getName().asString() + " logged out at position " + event.entity.getX() + " " + event.entity.getY() + " " + event.entity.getZ());
                }
            }
        }
    }

    private VertexConsumerProvider getOutline(BufferBuilderStorage buffers, float r, float g, float b) {
        OutlineVertexConsumerProvider ovsp = buffers.getOutlineVertexConsumers();
        ovsp.setColor((int) (r * 255), (int) (g * 255), (int) (b * 255), 255);
        return ovsp;
    }
}
