package net.theairblow.lunarium.command.commands;

import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.command.Command;
import net.theairblow.lunarium.utils.BleachLogger;
import net.theairblow.lunarium.utils.file.BleachFileHelper;

public class CmdFriends extends Command {

	@Override
	public String getAlias() {
		return "friends";
	}

	@Override
	public String getDescription() {
		return "Manage friends";
	}

	@Override
	public String getSyntax() {
		return "friends add [user] | friends remove [user] | friends list | friends clear";
	}

	@Override
	public void onCommand(String command, String[] args) throws Exception {
		if (args[0].equalsIgnoreCase("add")) {
			if (args.length < 2) {
				BleachLogger.errorMessage("No username selected");
				BleachLogger.errorMessage(getSyntax());
				return;
			}

			LunariumClient.friendMang.add(args[1]);
			BleachLogger.infoMessage("Added \"" + args[1] + "\" to the friend list");
		} else if (args[0].equalsIgnoreCase("remove")) {
			if (args.length < 2) {
				BleachLogger.errorMessage("No username selected");
				BleachLogger.errorMessage(getSyntax());
				return;
			}

			LunariumClient.friendMang.remove(args[1].toLowerCase());
			BleachLogger.infoMessage("Removed \"" + args[1] + "\" from the friend list");
		} else if (args[0].equalsIgnoreCase("list")) {
			String text = "";

			for (String f : LunariumClient.friendMang.getFriends()) {
				text += "\n\u00a72" + f;
			}

			BleachLogger.infoMessage(text);
		} else if (args[0].equalsIgnoreCase("clear")) {
			LunariumClient.friendMang.getFriends().clear();

			BleachLogger.infoMessage("Cleared Friend list");
		} else {
			BleachLogger.errorMessage("Invalid Syntax!\n" + getSyntax());
		}

		BleachFileHelper.SCHEDULE_SAVE_FRIENDS = true;
	}

}
