package 
{
	import air.net.SecureSocketMonitor;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author hanz
	 */
	public class controlImg extends MovieClip 
	{
		[Embed(source="../lib/wasd.gif")]
		private var img:Class;
		private var bmp:Bitmap = new img();
		private var rX:Number = 0.0;
		private var rY:Number = 0.0;
		public function controlImg()
		{
			this.addChild(bmp);
			bmp.x -= this.width / 2.0;
			bmp.y -= this.height / 2.0;
		}
		public function setPos(x:Number,y:Number):void
		{
			rX = x;
			rY = y;
			setInternalPos(x, y);
		}
		private function setInternalPos(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		public function rotateWithMap(angle:Number):void
		{
			this.rotationZ = angle * (180.0 / Math.PI);
		}
	}
	
}