package com.example.util;   //VT100과 같으나 인터페이스로 구현

public interface VT101 {
	
	public static void clearScreen() {
		System.out.print("\033[2J");
	}
	
	public static void cursorMove(int line, int columm) {
		System.out.printf("\033[%d;%dH", line , columm);
	}

	public static void setForeground(int fg) {
		System.out.printf("\033[%dm", fg);
	}
	
	public static void setForeground(Color fg) {
		System.out.printf("\033[%dm", fg.ordinal()+30);
	}
	
	public static void setBackground(int bg) {
		System.out.printf("\033[%dm", bg);
	}
	
	public static void setBackground(Color bg) {
		System.out.printf("\033[%dm", bg.ordinal()+40);
	}
	
	public static void reset() {
		System.out.print("\033[0m");
	}
	
	public static void print(char ch) {
		System.out.print(ch);
	}
	

}
