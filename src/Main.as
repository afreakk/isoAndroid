package 
{
	import flash.automation.KeyboardAutomationAction;
	import flash.concurrent.Mutex;
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.display.Graphics;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author hanz
	 */
	public class Main extends Sprite 
	{
		public const sWidth:Number 	= 480.0;
		public const sHeight:Number 	= 762.0;
		private var map:MovieClip = new MovieClip();
		private var angle:Number = 0;
		private var time:Number = 0;
		private const mapWidth:Number = vecOp.mapX;
		private const mapHeight:Number = vecOp.mapY;
		private const mapLength:Number = vecOp.mapZ;
		private const mHeight:Number = 2;
		private const mWidth:Number = 10;
		private const mLength:Number = 10;
		private var pPos:vec3 = new vec3(0, 0, 0);
		private const pScaleW:Number = 10.0;
		private const pScaleH:Number = 5.0;
		[Embed(source = "../lib/n1.mp3")]
		private const clip:Class;	 
		private var music:Sound = new clip();
		private var peak:Number = 0.0;
		private var note:vec3 =  new vec3(100, 10, 100);
		private var kPeak:Number = 0;
		[Embed(source = "../lib/shader.obj", mimeType = "application/octet-stream")]
		private var mShader:Class;
		private var shader:Shader = new Shader( );
		private function getSpectrum():void
		{
			var bytes:ByteArray = new ByteArray(); 
			SoundMixer.computeSpectrum(bytes, false, 0);
			peak = 0.0;
			var highest:Number = 0.0;
			var index:Number = 0.0;
			for (var i:int = 0; i < 256; i++)
			{
				var curr:Number = bytes.readFloat();
				peak += curr;
				if (curr > highest)
				{
					highest = curr;
					index = i;
				}
			}
			kPeak += peak/70.0;
			note.x = ((Math.cos(time)+1.0)/2.0) * (mapWidth-pScaleW);
			note.z = ((Math.sin(kPeak)+1.0)/2.0)  * (mapLength-pScaleW);
			note.y = 0.0;
			
		}
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, kDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, kUp);
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			init();
			// entry point
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		private var fwd:Boolean ;
		private var bck:Boolean ;
		private var lft:Boolean ;
		private var rgt:Boolean ;
		private function kUp(e:KeyboardEvent):void
		{
			kHandle(e, false);
		}
		private function kDown(e:KeyboardEvent):void
		{
			kHandle(e, true);
		}
		private function kHandle(e:KeyboardEvent, toggle:Boolean):void
		{
			if (e.keyCode == Keyboard.W)
				fwd = toggle;
			else if (e.keyCode == Keyboard.S)
				bck = toggle;
			else if (e.keyCode == Keyboard.D)
				rgt = toggle;
			else if (e.keyCode == Keyboard.A)
				lft = toggle;
		}
		private function playerControl(pos:vec3):vec3
		{	
			var speed:Number = 5.0;
			if (bck&&pos.z+speed<=mapLength-pScaleW)
				pos.z += speed;
			if (fwd&&pos.z-speed>=0)
				pos.z -= speed;
			if (rgt&&pos.x+speed<=mapWidth-pScaleW)
				pos.x += speed;
			if (lft&&pos.x-speed>=0)
				pos.x -= speed;
			return pos;
		}
		private function update(e:Event):void
		{
			time += 0.01;
			angle = time;// +Math.PI * 0.75;
			vec3.angle = this.angle;
			if (!vecOp.hitTest(pPos, pScaleW, note, pScaleW))
			{
				ctrls.rotateWithMap(angle);
				var fTime:int = time * 10.0;
				scoreTxt.updateText("score: "+fTime.toString());
				getSpectrum();
				pPos = playerControl(pPos);
				map.graphics.clear();
				
				Geom.updateMap(map.graphics,mLength,mWidth,mHeight,mapLength,mapWidth,mapHeight);
				Geom.makeBox(pPos,ColourUtil.RGBToHex(0,255,0),1,map.graphics,pScaleW,pScaleH);
				Geom.makeBox(note, ColourUtil.RGBToHex(255, 0, 0), 1, map.graphics, pScaleW, pScaleH);
				
				var vv:vec3 = new vec3(mapWidth/2.0, 0, mapLength/2.0);
				Geom.makeArrow(map, upTxt, vv, 50, angle);
				
				var vCorner0:vec3 = new vec3(mapWidth/2.0, -50, mapLength/2.0,true);
				var border0:vec3 = new vec3(0, 0, 0);
				var border1:vec3 = new vec3(mapWidth, 0, 0);
				var border2:vec3 = new vec3(mapWidth, 0, mapLength);
				var border3:vec3 = new vec3(0, 0, mapLength);
				Geom.lineiso(map.graphics, border0, vCorner0);
				Geom.lineiso(map.graphics, border1, vCorner0);
				Geom.lineiso(map.graphics, border2, vCorner0);
				Geom.lineiso(map.graphics, border3, vCorner0);
			}
			else
			{
				insTxt.updateText("Game Over.");
				if (!oneButton)
					makeResetBtn()
				if (tButton.clicked)
					reset();
			}
		}
		private var oneButton:Boolean = false;
		private function reset():void
		{
			insTxt.updateText("Avoid the red box!");
			this.removeChild(tButton);
			time = 0;
			pPos = new vec3(0, 0, 0);
			oneButton = false;
		}
		private function makeResetBtn():void
		{
			tButton = new tryAgain();
			tButton.x = sWidth / 2.0;
			tButton.y = sHeight / 2.0;
			this.addChild(tButton);
			oneButton = true;
		}
		private var scoreTxt:texting;
		private var insTxt:texting;
		private var upTxt:TextField;
		private var ctrls:controlImg;
		private var tButton:tryAgain;
		private function init():void
		{
			
			ctrls = new controlImg();
			ctrls.scaleX = 0.5;
			ctrls.scaleY = 0.5;
			ctrls.setPos(sWidth / 2.0, sHeight / 16.0);
			this.addChild(ctrls);
			insTxt = new texting(2.0);
			scoreTxt = new texting(2.0);
			upTxt = new TextField();
			insTxt.setPos(sWidth / 2.0, sHeight / 8.0);
			scoreTxt.setPos(sWidth / 2.0, sHeight / 4.0);
			insTxt.updateText("Avoid the red box!");
			upTxt.text = "up!";
			map.addChild(upTxt);
			this.addChild(insTxt);
			this.addChild(scoreTxt);
			music.play();
			map.x = sWidth/2.0;
			map.y = sHeight / 2.5;
			map.scaleX = 2;
			map.scaleY = 2;
			this.addChild(map);
			
			
		}
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}