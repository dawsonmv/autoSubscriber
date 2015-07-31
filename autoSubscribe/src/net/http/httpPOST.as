package net.http
{

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.sendToURL;
	
	public class httpPOST extends EventDispatcher
	{
		
		private var uReq:URLRequest;
		
		public function httpPOST()
		{
			super();
			
			uReq = new URLRequest();
			
			uReq.method = URLRequestMethod.POST;
			uReq.contentType = "application/x-www-form-urlencoded";
			
		}		
		
		public function SubscribeTo( ListUrl:String , PostData:URLVariables ):void
		{			
			uReq.url = ListUrl;
			uReq.data = PostData;
			
			try {
				sendToURL( uReq );
			}  catch (e:Error) {
				var err:ErrorEvent = new ErrorEvent( ErrorEvent.ERROR , false , false , e.name +": "+e.message+"/n"+e.getStackTrace() , e.errorID ); 
				dispatchEvent( err);
			} 
	
			dispatchEvent( new Event( Event.COMPLETE ) );
			
		}
		
	}
}