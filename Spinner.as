package  
{
	import flash.display.Sprite;
	import flash.display.CapsStyle;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Spinner extends Sprite
	{
		private static const SEGMENT_COUNT:int = 12;
		
		private var m_radius:Number;
		private var m_segmentLength:Number;
		private var m_strokeWidth:Number;
		
		private var m_timer:Timer;
		private var m_counter:uint = 0;
		
		public function Spinner(radius:Number = 10, segmentLength:Number = 7, strokeWidth:Number = 3) 
		{
			m_radius = radius;
			m_segmentLength = segmentLength;
			m_strokeWidth = strokeWidth;
			
			m_timer = new Timer(90);
			m_timer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, true);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		private function addedToStage(event:Event):void 
		{
			drawSelf(m_counter);
			m_timer.start();	
		}
		
		private function removedFromStage(event:Event):void 
		{
			m_timer.reset();
			m_counter = 0;
		}
		
		private function onTimer(event:TimerEvent):void 
		{
			m_counter += 1;
			drawSelf(m_counter);
		}
		
		private function posOnCircleForAngleAndRadius(angle:Number, radius:Number):Point
		{
			var x:Number = Math.cos(angle) * radius;
			var y:Number = Math.sin(angle) * radius;
			
			return new Point(x, y);
		}
		
		private function drawSelf(positionInCircle:Number):void 
		{
			graphics.clear();
			
			var startAngle:Number = positionInCircle % SEGMENT_COUNT;
			
			for (var i:int = 0; i < SEGMENT_COUNT; i++) 
			{
				var angle:Number = i / SEGMENT_COUNT * 2 * Math.PI + (startAngle / SEGMENT_COUNT * 2 * Math.PI);
				var p1:Point = posOnCircleForAngleAndRadius(angle, m_radius);
				var p2:Point = posOnCircleForAngleAndRadius(angle, m_radius + m_segmentLength);
				
				var color:uint = 0xffffff;
				var alpha:Number = i / SEGMENT_COUNT * 0.9;
				
				graphics.lineStyle(m_strokeWidth, color, alpha, false, "normal", CapsStyle.ROUND, null, 3);
				graphics.moveTo(p1.x, p1.y);
				graphics.lineTo(p2.x, p2.y);
			}	
		}
	}
}