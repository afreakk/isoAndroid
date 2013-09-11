package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author hanz
	 */
	public class texting extends MovieClip
	{
		private var textDisplay:TextField;
		private var rX:Number = 0.0;
		private var rY:Number = 0.0;
		public function texting(scale:Number)
		{
			textDisplay = new TextField();
			textDisplay.x = 0.0;
			textDisplay.y = 0.0;
			textDisplay.scaleX = scale;
			textDisplay.scaleY = scale;
			textDisplay.text = "0";
			this.addChild(textDisplay);
		}
		public function setPos(xp:Number, yp:Number):void
		{
			rX = xp;
			rY = yp;
			this.x = xp-textDisplay.textWidth;
			this.y = yp-textDisplay.textHeight;
		}
		public function updateText(txt:String):void
		{
			textDisplay.text = txt;
			setPos(rX, rY);
		}
	}
	
}