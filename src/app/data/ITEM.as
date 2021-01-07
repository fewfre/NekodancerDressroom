package app.data
{
	public class ITEM
	{
		public static const POSE				: String = "pose";
		public static const SKIN				: String = "skin";
		
		public static const HEAD				: String = "head";
		public static const EYES				: String = "eyes";
		public static const SHIRT				: String = "shirt";
		public static const PANTS				: String = "pants";
		public static const SHOES				: String = "shoes";
		public static const GLASSES				: String = "glasses";
		
		// Order of item layering when occupying the same spot.
		public static const LAYERING			: Array = [ SKIN, HEAD, EYES, GLASSES, SHIRT, PANTS, SHOES ];
	}
}