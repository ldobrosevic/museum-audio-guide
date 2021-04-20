package hr.fer.apptownfunk.util;

public class ViewCounter {
	private static int index = 0;
	private static int allExhibitions = 0;
	private static int allExhibits = 0;

	private ViewCounter() {
		
	}
	/**
	 * @return the index
	 */
	public static int getIndex() {
		return index;
	}

	/**
	 * @param index
	 *            the index to set
	 */
	public static void addIndex() {
		ViewCounter.index++;
	}

	/**
	 * @return the allExhibitions
	 */
	public static int getAllExhibitions() {
		return allExhibitions;
	}

	/**
	 * @param allExhibitions
	 *            the allExhibitions to set
	 */
	public static void addAllExhibitions() {
		ViewCounter.allExhibitions++;
	}

	/**
	 * @return the allExhibits
	 */
	public static int getAllExhibits() {
		return allExhibits;
	}

	/**
	 * @param allExhibits
	 *            the allExhibits to set
	 */
	public static void addAllExhibits() {
		ViewCounter.allExhibits++;
	}

}
