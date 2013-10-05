package com.snakybo.platformengine.utils {
	
	/** @author Kevin Krol */
	public class Time {
		public static const SECOND:Number = 1000000000;
		
		private static var delta:Number;
		
		/** Set delta */
		public static function setDelta(delta:Number):void {
			Time.delta = delta;
		}
		
		/** Get time */
		public static function getTime():Number {
			return new Date().milliseconds / 1000000;
		}
		
		/** Get delta */
		public static function getDelta():Number {
			return delta;
		}
	}
}
