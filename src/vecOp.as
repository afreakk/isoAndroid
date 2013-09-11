package 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author hanz
	 */
	public class  vecOp
	{
		public static var mapX:Number = 100;
		public static var mapY:Number = 10;
		public static var mapZ:Number = 100;
		public static function rotateY(pos:vec3, angle:Number):vec3
		{
			var nvec:vec3 = new vec3(0, 0, 0);
			var tempVec:vec3 = new vec3(pos.x, pos.y, pos.z);
			tempVec.x -= mapX / 2.0;
			tempVec.y -= mapY / 2.0;
			tempVec.z -= mapZ / 2.0;
			/*nvec.x = tempVec.x * Math.cos(angle) - tempVec.y * Math.sin(angle);
			nvec.y = tempVec.y;
			nvec.z = tempVec.x * Math.sin(angle/2.0) + tempVec.z * Math.cos(angle/2.0);*/
			nvec.x = tempVec.x * Math.cos(angle) - tempVec.y * Math.sin(angle);
			nvec.y = tempVec.x * Math.sin(angle) + tempVec.y * Math.cos(angle);;
			nvec.z = tempVec.z;
			nvec.x += mapX / 2.0;
			nvec.y += mapY / 2.0;
			nvec.z += mapZ / 2.0;
			return nvec;
		}
		public static function hitTest(pos1:vec3, size1:Number, pos2:vec3, size2:Number):Boolean
		{
			if ((pos1.x + size1) < pos2.x)
				return false;
			if (pos1.x > (pos2.x + size2))
				return false;
			if ((pos1.z +size1) < pos2.z)
				return false;
			if (pos1.z > (pos2.z + size2))
				return false;
			return true;
		}
		/*public static function rotateYfloat(x:Number,y:Number,z:Number, angle:Number):vec3
		{
			var nvec:vec3 = new vec3(0, 0, 0);
			var tempVec:vec3 = new vec3(x, y, z);
			tempVec.x -= mapX / 2.0;
			//tempVec.y -= mapY / 2.0;
			tempVec.z -= mapZ / 2.0;
			nvec.x = tempVec.x * Math.cos(angle) - tempVec.y * Math.sin(angle);
			nvec.y = tempVec.y;
			nvec.z = tempVec.x * Math.sin(angle) + tempVec.z * Math.cos(angle);
			nvec.x += mapX / 2.0;
			//nvec.y += mapY / 2.0;
			nvec.z += mapZ / 2.0;
			return nvec;
		}*/
	}
	
}