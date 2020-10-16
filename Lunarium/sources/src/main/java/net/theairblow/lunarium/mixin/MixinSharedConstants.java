package net.theairblow.lunarium.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Overwrite;

import net.theairblow.lunarium.module.Module;
import net.theairblow.lunarium.module.ModuleManager;
import net.theairblow.lunarium.module.mods.NoKeyBlock;
import net.minecraft.SharedConstants;

@Mixin(SharedConstants.class)
public class MixinSharedConstants {

	@Overwrite
	public static boolean isValidChar(char chr) {
		Module noKeyBlock = ModuleManager.getModule(NoKeyBlock.class);

		if (!noKeyBlock.isToggled()) {
			return chr != 167 && chr >= ' ' && chr != 127;
		}

		return (noKeyBlock.getSetting(0).asToggle().state || chr != 167)
				&& (noKeyBlock.getSetting(1).asToggle().state || chr >= ' ')
				&& (noKeyBlock.getSetting(2).asToggle().state || chr != 127);
	}
}
