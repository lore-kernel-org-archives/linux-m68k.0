From: mike <localgost@gmail.com>
Subject: Re: debian installation
Date: Tue, 29 Sep 2009 11:45:27 +0200
Message-ID: <8259f0250909290245n7328cae1nfe88cf6a2582ebf3@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <alpine.OSX.2.00.0909050045330.383@silk.local>
	 <4AA2684E.1080009@codesourcery.com>
	 <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
	 <4AAC7CB6.2060400@codesourcery.com>
	 <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
	 <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com>
	 <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com>
	 <alpine.OSX.2.00.0909290020580.412@silk.local>
	 <8259f0250909280744t69991f25pb6a498775c57482d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f211.google.com ([209.85.219.211]:38352 "EHLO
	mail-ew0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097AbZI2JpY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Sep 2009 05:45:24 -0400
Received: by ewy7 with SMTP id 7so5230554ewy.17
        for <linux-m68k@vger.kernel.org>; Tue, 29 Sep 2009 02:45:27 -0700 (PDT)
In-Reply-To: <8259f0250909280744t69991f25pb6a498775c57482d@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hm,

Is there a problem with slip?
When i do ifup sl0 i get siocsifflags no such file or directory

-Mike

2009/9/28 mike <localgost@gmail.com>:
> Thanks Finn
>
> depmod -ae did it.
>
> With a bit of luck i can get a dist-upgrade if i can get slip working
> and sharing between my box here.. Think i'll upload this install to
> aminet so i dont loose it when im done with a detailed guide on how to
> configure etc...... This is the most complicated install i've ever
> done
>
> -Mike
>
> 2009/9/28 Finn Thain <fthain@telegraphics.com.au>:
>>
>>
>> On Mon, 28 Sep 2009, mike wrote:
>>
>>> Ok, i've nearly finished my manual install of 3.1r8...
>>> I've got two problems, im missing
>>> /lib/modules/2.4.27-amiga/modules.dep ( does anyone have it handy? )
>>
>> It is generated using the "depmod -ae" command (I think those are the
>> correct arguments...) Normally it is generated at boot time, but I guess
>> it is not run if you stop at the single user run level.
>>
>>>
>>> And a "passwd: Authentication token manipulation error"
>>
>> Sounds familiar but I don't recall what the cause was. Maybe google it.
>>
>> Finn
>>
>>> I've checked the perms of /etc/shadow they are shadow root and correct
>>> rw. so is passwd
>>>
>>> And i can so far only boot into single user mode. But that will work for now.
>>>
>>> -Mike
>>
>
