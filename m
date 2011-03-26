From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Sat, 26 Mar 2011 14:26:29 +1300
Message-ID: <4D8D40C5.9050308@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de> <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de> <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com> <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com> <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org> <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com> <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org> <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com> <4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com> <4D461512.8080609@gmail.com> <alpine.LNX.2.00.1101311424100.6256@nippy.intranet> <Pine.BSM.4.64L.1102052339100.22476@herc.mirbsd.org> <4D575F50.1020601@gmail.com> <4D5CCCA5.1000106@gmail.com> <Pine.BSM.4.64L.11021718172
 30.3948@herc.mirbsd.org> <AANLkTi=RUod3zBnOpCX5pvg5CTVU2t5xAKh8qNo+Z14i@mail.gmail.com> <Pine.BSM.4.64L.1103131036510.11986@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:53778 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab1CZB0m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Mar 2011 21:26:42 -0400
Received: by pzk9 with SMTP id 9so227910pzk.19
        for <linux-m68k@vger.kernel.org>; Fri, 25 Mar 2011 18:26:41 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1103131036510.11986@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Thorsten,
> Michael Schmitz dixit:
>
>   
>> the reversal seems to result from the way I ended the bisect. Applying
>>     
>
> Ah okay.
>
>   
>> the posted patch to the Debian 2.6.27 source you had used initially
>> does indeed seem to fix the problem.  I still need to test that after
>>     
>
> Good, then I can use that (for now).
>   
Finally had time to test it on my development ARAnyM system which has 
slabinfo installed. Debian 2.6.37 with the offending patch reverted does 
run fine there, and slabinfo -l or -T do not report any errors.

The only difference that patch introduces is to use a static kmem cache 
node in place of a dynamically allocated one. If the allocated one was 
freed by accident that would affect other architectures I presume.

Can you try Thorstens kernel and one with my patch on your Amiga, Geert? 
The brk address space randomization regression was only introduced later 
IIRC?

Just trying to find out whether the Atari init code is to blame here ...

Cheers,

  Michael


> Many thanks!
> //mirabilos
>   
