package com.snakybo.platformengine {
	import com.snakybo.platformengine.block.BlockStone;
	import com.snakybo.platformengine.entity.Entity;
	import com.snakybo.platformengine.sound.SoundHandler;
	import com.snakybo.platformengine.world.World;
	import flash.events.Event;
	import com.snakybo.platformengine.block.Block;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/** @author Kevin Krol */
	public class Game {
		public static var main:Main;
		
		private var keyDown:Boolean;
		private var keyboardEvent:KeyboardEvent;
		
		public function Game(main:Main) {
			Game.main = main;
				
			new World(0);
		}
		
		/** On key down */
		public function onKeyDown(e:KeyboardEvent):void {
			keyDown = true;
			keyboardEvent = e;
		}
		
		/** On key up */
		public function onKeyUp(e:KeyboardEvent):void {
			keyDown = false;
			keyboardEvent = e;
		}
		
		/** Game update method */
		public function update(evt:Event):void {
			for each(var e:Entity in World.entities) {
				if (keyDown) {
					e.input(keyboardEvent);
				}
				
				e.update(evt);
			}
		}
	}
}