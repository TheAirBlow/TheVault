package net.theairblow.lunarium.module.mods;
import net.theairblow.lunarium.event.events.EventTick;
import net.theairblow.lunarium.module.Category;
import net.theairblow.lunarium.module.Module;
import com.google.common.eventbus.Subscribe;
import net.minecraft.network.packet.c2s.play.PlayerMoveC2SPacket;

public class FastFall extends Module {
	public FastFall() {
        super("FastFall", KEY_UNBOUND, Category.MOVEMENT, "Fall momentally");
    }

    @Subscribe
    public void onTick(EventTick event)
    {
        if(mc.player == null || mc.world == null || mc.player.isInLava() || mc.player.isSubmergedInWater())
        {
            return;
        }
        if(mc.player.isOnGround())
        {
            mc.player.setVelocity(mc.player.getVelocity().x, -1, mc.player.getVelocity().z);
            mc.player.networkHandler.sendPacket(new PlayerMoveC2SPacket(true));
        }
    }
}
