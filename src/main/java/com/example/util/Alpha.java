package com.example.util;

//import java.util.Map;

import java.util.Objects;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Alpha {
	protected int line;
	protected int column;
	protected  Color fg;
	protected  Color bg;
	protected char ch;

	
	public Alpha() {
		line = (int)(Math.random()*20 + 1);
		column = (int)(Math.random()*40 + 1);
		
		do {
		fg = Color.values()[(int)(Math.random()*8)];
		bg = Color.values()[(int)(Math.random()*8)];
		}while(fg==bg);
		
		ch = (char)(Math.random()*26 + 'A');
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(line, column);
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Alpha target) {
			return line==target.line && column==target.column;
		}
		return false;
	}
	
	@Override
	public String toString() {
		return String.format("[%d, %d, %d, %d, %c]", line, column, fg.ordinal()+30, bg.ordinal()+40, ch);
	}
	
	public int Rline() {
		return line;
	}
	
	public int Cline( ) {
		return column;
	
	}
	
	public char Cari() {
		return ch;
	}
	
	public void show() {
		VT100.cursorMove(line, column);
		VT100.setForeground(fg);
		VT100.setBackground(bg);
		VT100.print(ch);
//		show(1, 1); 하면 밑에 함수 하나만 있으면 된다
	}
	
	public void show(int offLine, int offColumn) {
		VT100.cursorMove(line+offLine-1, column+offColumn-1);
		VT100.setForeground(fg);
		VT100.setBackground(bg);
		VT100.print(ch);
		
	}
	
	public void hide() {                   // 원래 Alpha.java파일에서 추가
		VT100.cursorMove(line, column);
		VT100.reset();
		VT100.print(' ');
	}
	
	public int getLine() {
		return line;
	}
	
	public void setLine(int line) {
		this.line = line;
	}

	public int getColumn() {
		return column;
	}

	public void setColumn(int column) {
		this.column = column;
	}

	public Color getFg() {
		return fg;
	}

	public void setFg(Color fg) {
		this.fg = fg;
	}

	public Color getBg() {
		return bg;
	}

	public void setBg(Color bg) {
		this.bg = bg;
	}

	public char getCh() {
		return ch;
	}

	public void setCh(char ch) {
		this.ch = ch;
	}
	
	
	
	
	
	
	
	
	
	

}
