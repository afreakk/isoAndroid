package 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author hanz
	 */
	public class tryAgain extends MovieClip
	{
		[Embed(source = "../lib/tagain.png")]
		private var img:Class;
		private var bmp:Bitmap = new img();
		public var clicked:Boolean = false;
		public function tryAgain()
		{
			this.addChild(bmp);
			bmp.x -= this.width / 2.0;
			bmp.y -= this.height / 2.0;
			this.addEventListener(MouseEvent.CLICK, klikk);
		}
		private function klikk(e:MouseEvent):void
		{
			clicked = true;
		}
	}
	
}