package net.theairblow.lunarium.update;

import java.util.List;
import net.theairblow.lunarium.LunariumClient;
import net.theairblow.lunarium.utils.file.BleachGithubReader;

public class VersionManager {
	public static boolean isLatest() {
		List<String> version = BleachGithubReader.readFileLines("version.txt");
		if (Integer.parseInt(version.get(1)) > LunariumClient.INTVERSION) {
			return true;
		} else {
			return false;
		}
	}
	
	public static String newestVersion() {
		List<String> version = BleachGithubReader.readFileLines("version.txt");
		return version.get(0);
	}
	
	public static String updateLink() {
		return "https://github.com/TheAirBlow/lunarium/releases/download/" + newestVersion() + "/lunarium.jar";
	}
}
