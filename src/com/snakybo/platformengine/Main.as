package com.snakybo.platformengine {
	import com.snakybo.platformengine.block.BlockStone;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.snakybo.platformengine.block.Block;
	import flash.events.KeyboardEvent;
	
	/** @author Kevin Krol */
	public class Main extends Sprite {
		public function Main():void {
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var game:Game = new Game(this);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, game.onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, game.onKeyUp);
			
			addEventListener(Event.ENTER_FRAME, game.update);
		}
	}
}