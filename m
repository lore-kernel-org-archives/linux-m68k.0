From: Riccardo <riccardo@kaffe.org>
Subject: Re: current 2.6 on Q950
Date: Thu, 14 May 2009 16:06:46 +0200
Message-ID: <75999A9B-4090-11DE-A812-00050249ADE1@kaffe.org>
References: <Pine.LNX.4.64.0905121332190.8193@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out12.libero.it ([212.52.84.112]:59824 "EHLO
	cp-out12.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753882AbZENOGv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 May 2009 10:06:51 -0400
In-Reply-To: <Pine.LNX.4.64.0905121332190.8193@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

Hi,

> The patches that I sent were merged into that release (2.6.29). So X11
> works again, and mac_esp supports both SCSI busses on the quadras 9x0.
>

very cool, I extra checked and I still had the option to disable the 
scsi BUS in penguin.
Indeed I see:
[42949375.000000] mac_esp: using PDMA for controller 0
[42949378.080000] mac_esp: using PDMA for controller 1

My external MO disk doesn't get recognized though. I'll check that it 
still works on MacOS though.

X11 doesn't work for me, but I'll write separately about that.

> I haven't heard anything more since you raised it on this mailing list
> back in October. I never implemented the workaround that was discussed 
> at
> the time because I have more pressing bugs on my todo list, and because
> I'd like to try and figure out how the hardware works before resorting 
> to
> workarounds...

Oh sure, also because once a workaround gets implemented, the 
motivation to do the real thing gets even less. The real access would 
be very good together with EMILE.

>
>> and that hard disk performance is still bad.
>
> If dmesg says that PDMA is in use on scsi0 and scsi1, then I'm afraid 
> it
> probably isn't going to get any faster. But performance should be
> comparable with NetBSD if not MacOS (though I never benchmarked 
> either).
>

I just run bonnie:

Version 1.03e       ------Sequential Output------ --Sequential Input- 
--Random-
                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
elendil        120M   113  78  1323  72   754  66   123  89  1607  73  
99.3  35
                     ------Sequential Create------ --------Random 
Create--------
                     -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
               files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                  16    27  88  5272  99  1450  99    30  93  6229  99   
105  78

char operations are very slow (cpu bound? some libraries are 
inefficient?) , but thi could have other reasons. I see that block 
write is 1323 K/s and bloc reaad is 1.6, that is slower than the mac, 
but not abysmal, I don't remember this exact configuration, but 2-3 M/s 
were average for those old macs. IIRC the Q950 was a bit faster than 
the others on the internal chain, but it is clear there that the driver 
performs reasonably now.

Riccardo

