/*
 * This file is part of the LunariumClient distribution (https://github.com/TheAirBlow/LunariumClient).
 * Copyright (c) 2020 TheAirBlow.
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
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package net.theairblow.lunarium.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class TaskManager {
	private static ArrayList<String> tasks = new ArrayList<String>();

	public static String getCurrentTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return "[" + dtf.format(now) + "]";
	}
	
	public static int addTask(String task) {
		tasks.add(task);
		System.out.print(getCurrentTime() + " [main/INFO] (TaskManager) Task added - " + task + " (Index " + tasks.size() + ") \n");
		return tasks.size() - 1;
	}

	public static void endTask(String task) {
		int index = tasks.indexOf(task);
		System.out.print(getCurrentTime() + " [main/INFO] (TaskManager) Ended task '" + tasks.get(index) + "'\n");
		tasks.remove(index);
		if (tasks.size() < 1) {
			System.out.print(getCurrentTime() + " [main/INFO] (TaskManager) All tasks ended!\n");
		}
	}
	
	public static void clearTasks() {
		System.out.print(getCurrentTime() + " [main/INFO] (TaskManager) Cleared all tasks \n");
		tasks.clear();
	}
	
	public static boolean isTasksEnded() {
		if (tasks.size() < 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public static ArrayList<String> tasks() {
		return tasks;
	}
	
	public static int tasksLeft() {
		return tasks.size();
	}
}
