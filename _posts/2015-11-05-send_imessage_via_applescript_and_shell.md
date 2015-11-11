---
author: Bode
type: webimage
featimg: http://i12.tietuku.com/26a19095eb384b02.jpg
title: 用脚本发送iMessage的方法
tags: []
category: 
- 程序猿
---

最近在使用脚本自动编译上传App到iTunes，到最后一步有个需求，就是需要把上传结果及时通知多个人。一开始想使用Mail。但是又感觉用Mail有点太重了。所以打算用一个轻量级的解决方案——将上传结果，通过iMessage，直接发送到手机上。
  
发送iMessage需要使用Apple Script。
-----

<!-- more -->

{% highlight applescript %}
tell application "Messages"
  send "iMessage的内容" to buddy "foo@helloworld.com" of (service 1 whose service type is iMessage)
end tell
{% endhighlight %}
  
或者直接发送到手机号码也没有问题
{% highlight applescript %}
tell application "Messages"
  send "iMessage的内容" to buddy "+8612345678901" of (service 1 whose service type is iMessage)
end tell
{% endhighlight %}
  

	
  
如果你是个土豪，也可以通过短信方式发送
{% highlight applescript %}
tell application "Messages"
  send "iMessage的内容" to buddy "+8612345678901" of service "SMS"
end tell
{% endhighlight %}
	
	
  	
	
OK，然后我们需要在Shell中调用这段Apple Script，所以把内容和发送的对象作为参数传入。最后的脚本就是
{% highlight applescript %}
on run {receiver, message}
	tell application "Messages"
		send message to buddy receiver of (service 1 whose service type is iMessage)
	end tell
end run
{% endhighlight %}


将Apple Script保存为类似sendMessage.scpt


![iMessage](http://i12.tietuku.com/5309c6b703f03868.png)


在Shell中调用Apple Script
---
然后在Shell脚本中，用这样的方法来调用：
{% highlight bash %}
$ osascript sendMessage.scpt "+8612345678901" "iMessage的内容"
{% endhighlight %} 


好了，全部搞定！



参考
---
1. [Sending iMessages and SMS through Messages.app with AppleScript](http://www.tenshu.net/search/label/applescript "Title")
2. [在命令行中调用接收参数的AppleScript](http://www.giser.net/?p=782 "Title")