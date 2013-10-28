package com.snakybo.platform.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	
	/** @author Kevin Krol */
	public class XMLLoader extends EventDispatcher {
		public var xmlList:XMLList;
		public var xml:XML;
		
		public function XMLLoader() {
			super(null);
			
			xml = new XML();
		}
		
		/** Load URL */
		public function load(url:String, vars:URLVariables = null):void {
			var urlRequest:URLRequest = new URLRequest(url);
			var urlLoader:URLLoader = new URLLoader();
			
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			
			urlRequest.data = vars;
			urlRequest.method = URLRequestMethod.POST;
			
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			
			urlLoader.load(urlRequest);
		}
		
		/** On complete */
		private function onComplete(e:Event):void {
			var urlLoader:URLLoader = URLLoader(e.target);
			
			xml = XML(urlLoader.data);
			xmlList = xml.children();
			
			var completeEvent:Event = new Event(Event.COMPLETE);
			dispatchEvent(completeEvent);
			
			trace("XML loaded");
		}
		
		/** On IO Error */
		private function onIOError(e:IOErrorEvent):void {
			throw new Error("Error loading URL");
		}
		
		/** On Progress */
		private function onProgress(e:ProgressEvent):void {
			trace("XML loading: " + e.bytesLoaded + "/" + e.bytesTotal);
		}
	}
}