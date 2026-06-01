package ar.edu.unlp.info.oo1.ejercicio2;

public interface WallPost {

	String getText();

	void setText(String text);

	int getLikes();

	void like();

	void dislike();

	boolean isFeatured();
	
	void toggleFeatured();

}

