From: mike <localgost@gmail.com>
Subject: Re: debian installation
Date: Mon, 28 Sep 2009 16:44:42 +0200
Message-ID: <8259f0250909280744t69991f25pb6a498775c57482d@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <20090901151747.GB27514@marenka.net>
	 <alpine.OSX.2.00.0909050045330.383@silk.local>
	 <4AA2684E.1080009@codesourcery.com>
	 <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
	 <4AAC7CB6.2060400@codesourcery.com>
	 <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
	 <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com>
	 <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com>
	 <alpine.OSX.2.00.0909290020580.412@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:31629 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974AbZI1Ooj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Sep 2009 10:44:39 -0400
Received: by ey-out-2122.google.com with SMTP id 4so90053eyf.19
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2009 07:44:42 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.0909290020580.412@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Thanks Finn

depmod -ae did it.

With a bit of luck i can get a dist-upgrade if i can get slip working
and sharing between my box here.. Think i'll upload this install to
aminet so i dont loose it when im done with a detailed guide on how to
configure etc...... This is the most complicated install i've ever
done

-Mike

2009/9/28 Finn Thain <fthain@telegraphics.com.au>:
>
>
> On Mon, 28 Sep 2009, mike wrote:
>
>> Ok, i've nearly finished my manual install of 3.1r8...
>> I've got two problems, im missing
>> /lib/modules/2.4.27-amiga/modules.dep ( does anyone have it handy? )
>
> It is generated using the "depmod -ae" command (I think those are the
> correct arguments...) Normally it is generated at boot time, but I guess
> it is not run if you stop at the single user run level.
>
>>
>> And a "passwd: Authentication token manipulation error"
>
> Sounds familiar but I don't recall what the cause was. Maybe google it.
>
> Finn
>
>> I've checked the perms of /etc/shadow they are shadow root and correct
>> rw. so is passwd
>>
>> And i can so far only boot into single user mode. But that will work for now.
>>
>> -Mike
>
