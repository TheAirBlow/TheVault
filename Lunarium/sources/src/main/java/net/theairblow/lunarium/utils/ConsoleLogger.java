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

package net.theairblow.lunarium.utils;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  
import net.theairblow.lunarium.errors.ClassCrashError;

public class ConsoleLogger {
	
	public static String getCurrentTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return "[" + dtf.format(now) + "]";
	}
	
	public static void infoMessageConsole(String s) {
		System.out.print(getCurrentTime() + " [main/INFO] (Lunarium) " + s + "\n");
	}

	public static void warningMessageConsole(String s) {
		System.out.print(getCurrentTime() + " [main/WARN] (Lunarium) " + s + "\n");
	}

	public static void crashWithError(String s, int c) throws ClassCrashError {
		throw new ClassCrashError(s, c);
	}

	public static void errorMessageConsole(String s) {
		System.out.print(getCurrentTime() + " [main/ERROR] (Lunarium) " + s + "\n");
	}
}

