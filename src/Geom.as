package 
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author hanz
	 */
	public class Geom 
	{
		
		public static function makeBox(pos:vec3,color:uint,alpha:Number,g:Graphics,pScaleW:Number,pScaleH:Number):void
		{
			var pt1:vec3 = 	new vec3(pos.x, 			pos.y - pScaleH, 	pos.z, true);
			var pt1y:vec3 = new vec3(pos.x, 			pos.y, 				pos.z, true);
			var pt2:vec3 = 	new vec3(pos.x + pScaleW, 	pos.y - pScaleH, 	pos.z, true);
			var pt2y:vec3 = new vec3(pos.x + pScaleW, 	pos.y, 				pos.z, true);
			var pt3:vec3 = 	new vec3(pos.x + pScaleW, 	pos.y - pScaleH, 	pos.z + pScaleW, true);
			var pt3y:vec3 = new vec3(pos.x + pScaleW, 	pos.y, 				pos.z + pScaleW, true);
			var pt4:vec3 = 	new vec3(pos.x, 			pos.y - pScaleH, 	pos.z + pScaleW, true);
			var pt4y:vec3 = new vec3(pos.x, 			pos.y, 				pos.z + pScaleW, true);
			g.beginFill(color, alpha);
				g.moveTo(pt1.scrX(), pt1.scrY());
				
				g.lineTo(pt2.scrX(), pt2.scrY());
				g.lineTo(pt2y.scrX(), pt2y.scrY());
				g.moveTo(pt2.scrX(), pt2.scrY());
				
				g.lineTo(pt3.scrX(), pt3.scrY());
				g.lineTo(pt3y.scrX(), pt3y.scrY());
				g.moveTo(pt3.scrX(), pt3.scrY());
				
				g.lineTo(pt4.scrX(), pt4.scrY());
				g.lineTo(pt4y.scrX(), pt4y.scrY());
				g.moveTo(pt4.scrX(), pt4.scrY());
				
				g.lineTo(pt1.scrX(), pt1.scrY());
				g.lineTo(pt1y.scrX(), pt1y.scrY());
				
				g.lineTo(pt2y.scrX(), pt2y.scrY());
				g.lineTo(pt3y.scrX(), pt3y.scrY());
				g.lineTo(pt4y.scrX(), pt4y.scrY());
				g.lineTo(pt1y.scrX(), pt1y.scrY());
	
		
			g.endFill();
		}
		/*public static function makeBoxP(pos:vec3,color:uint,alpha:Number,g:Graphics,scX:Number,scY:Number,scZ:Number):void
		{
			var pt1:vec3 = 	new vec3(pos.x, 			pos.y - scY, 		pos.z);
			var pt1y:vec3 = new vec3(pos.x, 			pos.y, 				pos.z);
			var pt2:vec3 = 	new vec3(pos.x + scX, 		pos.y - scY, 		pos.z);
			var pt2y:vec3 = new vec3(pos.x + scX, 		pos.y, 				pos.z);
			var pt3:vec3 = 	new vec3(pos.x + scX, 		pos.y - scY, 		pos.z + scZ);
			var pt3y:vec3 = new vec3(pos.x + scX, 		pos.y, 				pos.z + scZ);
			var pt4:vec3 = 	new vec3(pos.x, 			pos.y - scY, 		pos.z + scZ);
			var pt4y:vec3 = new vec3(pos.x, 			pos.y, 				pos.z + scZ);
			g.beginFill(color, alpha);
				g.moveTo(pt1.pX(), pt1.pY());
				
				g.lineTo(pt2.pX(), pt2.pY());
				g.lineTo(pt2y.pX(), pt2y.pY());
				g.moveTo(pt2.pX(), pt2.pY());
				
				g.lineTo(pt3.pX(), pt3.pY());
				g.lineTo(pt3y.pX(), pt3y.pY());
				g.moveTo(pt3.pX(), pt3.pY());
				
				g.lineTo(pt4.pX(), pt4.pY());
				g.lineTo(pt4y.pX(), pt4y.pY());
				g.moveTo(pt4.pX(), pt4.pY());
				
				g.lineTo(pt1.pX(), pt1.pY());
				g.lineTo(pt1y.pX(), pt1y.pY());
				
				g.lineTo(pt2y.pX(), pt2y.pY());
				g.lineTo(pt3y.pX(), pt3y.pY());
				g.lineTo(pt4y.pX(), pt4y.pY());
				g.lineTo(pt1y.pX(), pt1y.pY());
			g.endFill();
		}*/
		public static function makeArrow(m:MovieClip, t:TextField, pos:vec3, length:Number, angle:Number):void
		{
			var g:Graphics = m.graphics;
			var p0:vec3 = new vec3(pos.x, pos.y, pos.z, true);
			var p1:vec3 = new vec3(pos.x, pos.y - length, pos.z, true);
			g.lineStyle(1,ColourUtil.RGBToHex(100,100,255),1,true);
			g.moveTo(p0.scrX(), p0.scrY());
			g.lineTo(p1.scrX(), p1.scrY());
			var t0:vec3 = new vec3( pos.x-4, pos.y - length-10 , pos.z, true);
			t.x = t0.scrX();
			t.y = t0.scrY();
			t.rotationZ = angle * (180.0/Math.PI)
		}
		public static function lineiso(g:Graphics, posIso:vec3, posIsoT:vec3):void
		{
			
			var mPiso:vec3 = new vec3(posIso.x, posIso.y, posIso.z, true);
			var mPisoT:vec3 = new vec3(posIsoT.x, posIsoT.y, posIsoT.z, true);
			g.lineStyle(1, ColourUtil.RGBToHex(100, 100, 255), 1, true);
			g.moveTo(mPiso.scrX(), mPiso.scrY());
			g.lineTo(posIsoT.scrX(), posIsoT.scrY());
		}
		public static function lineLine(g:Graphics, pos0:vec3, pos1:vec3):void
		{
			g.lineStyle(1, ColourUtil.RGBToHex(100, 100, 255), 1, true);
			g.moveTo(pos0.x, pos0.y);
			g.lineTo(pos1.x, pos1.y);
		}
		public static function updateMap(g:Graphics,mLength:Number,mWidth:Number,mHeight:Number,mapLength:Number,mapWidth:Number,mapHeight:Number):void
		{
			var tull:Number = 10;
			for (var z:int = 0; z < mLength; z++)
			{
				
				var zPoint:Number = z * mapLength / (mLength-1);
				var xPoint:Number = mapWidth;
				var pz1:vec3 = new vec3(0, 0, zPoint,true);
				var pz2:vec3 = new vec3(xPoint, 0, zPoint, true);
				g.lineStyle((z / mLength) * 1, 0xFFFF00+z*27.0, 1, true);
				g.moveTo(pz1.scrX(), pz1.scrY());
				g.lineTo(pz2.scrX(), pz2.scrY());
			}
			for (var x:int = 0; x < mWidth; x++)
			{
				var zzPoint:Number = mapLength;
				var xxPoint:Number = x * mapWidth / (mWidth-1);
				var px1:vec3 = new vec3(xxPoint, 0, 0,true);
				var px2:vec3 = new vec3(xxPoint, 0, zzPoint, true);
				g.lineStyle((z / mLength) * 1, 0xFFFF00+x*27.0, 1, true);
				g.moveTo(px1.scrX(), px1.scrY());
				g.lineTo(px2.scrX(), px2.scrY());
			}
			for (var y:int = 0; y < mHeight; y++)
			{
					var cbdPoint1:vec3 = new vec3(0, y * mapHeight / (mHeight-1.0), 0,true);
					var cbdPoint2:vec3 = new vec3(mapWidth, y*mapHeight/(mHeight-1.0), 0,true);
					var cbdPoint3:vec3 = new vec3(mapWidth, y*mapHeight/(mHeight-1.0), mapLength,true);
					var cbdPoint4:vec3 = new vec3(0, y * mapHeight / (mHeight - 1.0), mapLength, true);
					g.lineStyle((z / mLength) * 1, 0xFFFF00+y*(27.0*5.0), 1, true);
					g.moveTo(cbdPoint1.scrX(), cbdPoint1.scrY());
					g.lineTo(cbdPoint2.scrX(), cbdPoint2.scrY());
					g.lineTo(cbdPoint3.scrX(), cbdPoint3.scrY());
					g.lineTo(cbdPoint4.scrX(), cbdPoint4.scrY());
					g.lineTo(cbdPoint1.scrX(), cbdPoint1.scrY());
			}
			g.lineStyle(1, 0, 0.2);
			var cp1:vec3 = new vec3(0, 			0, 				0,true);
			var cp2:vec3 = new vec3(0, 			mapHeight, 		0,true);
			
			var cp3:vec3 = new vec3(mapWidth,	0, 				0,true);
			var cp4:vec3 = new vec3(mapWidth, 	mapHeight, 		0,true);
			
			var cp5:vec3 = new vec3(mapWidth, 	0, 				mapLength,  true);
			var cp6:vec3 = new vec3(mapWidth,	mapHeight, 		mapLength,	true);
			
			var cp7:vec3 = new vec3(0, 			0, 				mapLength,	true);
			var cp8:vec3 = new vec3(0, 			mapHeight, 		mapLength,	true);
			
			g.moveTo(cp1.scrX(), cp1.scrY());
			g.lineTo(cp2.scrX(), cp2.scrY());
			g.moveTo(cp3.scrX(), cp3.scrY());
			g.lineTo(cp4.scrX(), cp4.scrY());
			g.moveTo(cp5.scrX(), cp5.scrY());
			g.lineTo(cp6.scrX(), cp6.scrY());
			g.moveTo(cp7.scrX(), cp7.scrY());
			g.lineTo(cp8.scrX(), cp8.scrY());
			
		}
	}
	
}