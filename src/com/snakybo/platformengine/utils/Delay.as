package com.snakybo.platformengine.utils {
	
	/** @author Kevin Krol */
	public class Delay {
		private var length:int;
		private var endTime:Number;
		private var started:Boolean;
		
		public function Delay(length:int) {
			this.length = length;
			this.started = false;
		}
		
		/** Check if delay is over */
		public function over():Boolean {
			if (!started) {
				return false;
			}
			
			return Time.getTime() >= endTime;
		}
		
		/** Start the delay */
		public function start():void {
			started = true;
			endTime = length * 1000000 + Time.getTime();
		}
		
		/** Reset delay */
		public function reset():void {
			started = false;
		}
	
		/** Return state of started */
		public function active():Boolean {
			return started;
		}
	
		/** End delay */
		public function end():void {
			started = true;
			endTime = 0;
		}
	}
}