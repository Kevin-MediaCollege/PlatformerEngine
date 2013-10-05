package com.snakybo.platformengine.entity.player {
	import com.snakybo.platformengine.entity.EntityLivingBase;
	import com.snakybo.platformengine.Game;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/** @author Kevin Krol */
	public class EntityPlayer extends EntityLivingBase {
		private var isWalking:Boolean;
		
		public function EntityPlayer(x:Number, y:Number) {
			super(new player(), 10, x, y);
		}
		
		public override function input(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case Keyboard.A:
					moveHorizontal(-1);
					break;
				case Keyboard.D:
					moveHorizontal(1);
					break;
				case Keyboard.SPACE:
					jump();
					break;
			}
		}
	}
}