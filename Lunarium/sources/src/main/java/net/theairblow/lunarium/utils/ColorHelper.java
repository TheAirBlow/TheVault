package net.theairblow.lunarium.utils;

public class ColorHelper {
	public static int getIntFromColor(int Red, int Green, int Blue){
	    Red = (Red << 16) & 0x00FF0000;
	    Green = (Green << 8) & 0x0000FF00;
	    Blue = Blue & 0x000000FF;
	    return 0xFF000000 | Red | Green | Blue;
	}
}
