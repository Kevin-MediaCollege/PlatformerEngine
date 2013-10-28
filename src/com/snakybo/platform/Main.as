package com.snakybo.platform {
	import com.snakybo.platform.level.Level;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/** @author Kevin Krol */
	public class Main extends Sprite {
		public static var instance:Main;
		
		private var level:Level;
		
		public function Main():void {
			instance = this;
			
			level = new Level();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void {
			level.update();
		}
	}
}