package com.snakybo.platformengine.sound {
	
	/** @author Kevin Krol */
	public class StepSound {
		private var name:String;
		private var volume:Number;
		
		public function StepSound(name:String, volume:Number) {
			this.name = name;
			this.volume = volume;
		}
		
		/** @return Volume */
		public function getVolume():Number {
			return this.volume;
		}
		
		/** @return Step sound */
		public function getStepSound():String {
			return "step." + this.name;
		}
	}
}