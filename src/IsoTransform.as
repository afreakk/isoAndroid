package 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author hanz
	 */
	public class IsoTransform 
	{
		private static const Y:Number = Math.cos( -Math.PI / 6) * Math.SQRT2;
		public static function isoToScreen(position:vec3):vec3
		{
			var screenX:Number = position.x - position.z;
			var screenY:Number = position.y * Y + (position.x + position.z) * 0.5;
			return new vec3(screenX, screenY);
		}
		public static function screenToIso(position:vec3):vec3
		{
			var isoX:Number = position.y + position.x * 0.5;
			var isoY:Number = 0;
			var isoZ:Number = position.y - position.x * 0.5;
			return new vec3(isoX, isoY, isoZ);
		}
		
	}
	
}