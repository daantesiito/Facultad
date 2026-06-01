package ar.edu.unlp.info.oo1.ejercicio2;

/**
 * Completar esta clase de acuerdo a lo especificado en el cuadernillo
 *
 */
public class WallPostImpl implements WallPost {

	private String text;
	private int likes;
	private boolean isFeatured;

	public WallPostImpl() {
		this.text = "Undefined post";

	}

	public WallPostImpl(String text, int likes, boolean isFeaured) {
		this.text = text;
		this.likes = likes;
		this.isFeatured = isFeaured;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;

	}

	public int getLikes() {
		return likes;
	}

	public void like() {
		this.likes = this.likes + 1;

	}

	public void dislike() {
		if (likes > 0) {
			this.likes = this.likes - 1;
		}

	}

	public boolean isFeatured() {
		return this.isFeatured;
	}

	public void toggleFeatured() {
		this.isFeatured = !this.isFeatured;

	}

	@Override
	public String toString() {
		return "WallPost {" + "text: " + getText() + ", likes: '" + getLikes() + "'" + ", featured: '" + isFeatured()
				+ "'" + "}";
	}

}
