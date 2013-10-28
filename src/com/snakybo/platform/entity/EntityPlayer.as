package com.snakybo.platform.entity {
	import com.snakybo.platform.Main;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/** @author Kevin Krol */
	public class EntityPlayer extends Entity {
		public function EntityPlayer(x:int, y:int) {
			super(x, y, 0x00FFFF);
			
			Main.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		/** On key down */
		private function onKeyDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
			case Keyboard.A:
				move(1, 1);
				break;
			case Keyboard.D:
				move(3, 1);
				break;
			case Keyboard.SPACE:
				jump();
				break;
			}
		}
	}
}