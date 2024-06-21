package com.mysingers.user;

public class Song {
	
	private String film,lyric, music,fileName;
	
	public Song(){}
	
	public Song(String film, String lyric, String music, String fileName) {
		super();
		this.film = film;
		this.lyric = lyric;
		this.music = music;
		this.fileName = fileName;
	}
	
	public String getFilm() {
		return film;
	}
	public void setFilm(String film) {
		this.film = film;
	}
	public String getLyric() {
		return lyric;
	}
	public void setLyric(String lyric) {
		this.lyric = lyric;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "Song [film=" + film + ", lyric=" + lyric + ", music=" + music
				+ ", fileName=" + fileName + "]";
	}
	
}
