package 
{
	
	/**
	 * ...
	 * @author hanz
	 */
	public class vec3 
	{
		private static const Y:Number = Math.cos( -Math.PI / 6) * Math.SQRT2;
		public var x:Number;
		public var y:Number;
		public var z:Number;
		public static var angle:Number = 0;
		public function scrX():Number
		{
			return this.x - this.z;
		}
		public function scrY():Number
		{
			return this.y * Y + (this.x + this.z) * 0.5;
		}
		public function pX():Number
		{
			return (this.x / this.z + 480.0/2.0)*(480.0/2.0);
		}
		public function pY():Number
		{
			return (-(this.y / this.z)+ 762.0/2.0)*(762.0/2.0);
		}
		public function vec3(x:Number=0,y:Number=0,z:Number=0,rotation:Boolean = false)
		{
			if (rotation)
			{
				var tempV:vec3 = new vec3(x, y, z);
				tempV = vecOp.rotateY(tempV, angle);
				this.x = tempV.x;
				this.y = tempV.y;
				this.z = tempV.z;
			}
			else
			{
				this.x = x;
				this.y = y;
				this.z = z;
			}
		}
		public function multiply(x:Number, y:Number, z:Number):void
		{
			this.x *= x;
			this.y *= y;
			this.z *= z;
		}
	}
	
}