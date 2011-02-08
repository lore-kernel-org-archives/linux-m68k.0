From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Early crash (was: Re: module: show version information for
 built-in modules in sysfs)
Date: Tue, 8 Feb 2011 22:46:01 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1102082244420.19833@herc.mirbsd.org>
References: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
 <20110201210944.GA12348@dtor-ws.eng.vmware.com>
 <AANLkTimv=KqtuR36dMNa+=OMi0mgd8JK4qsb_SpmKmhs@mail.gmail.com>
 <20110201222637.GA17521@dtor-ws.eng.vmware.com>
 <AANLkTikWVt8NEyHN+=yD4EWSXUQt0gt5nLJtKQDw397M@mail.gmail.com>
 <20110202194227.GA13794@dtor-ws.eng.vmware.com> <m2ipx2dp7v.fsf@igel.home>
 <20110202235948.GA8676@dtor-ws.eng.vmware.com> <m2bp2udllv.fsf@igel.home>
 <20110203002459.GA26729@dtor-ws.eng.vmware.com> <m2mxmdm323.fsf@igel.home>
 <Pine.BSM.4.64L.1102052346060.22476@herc.mirbsd.org> <m2tygedxgz.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:7292 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755886Ab1BHWsc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Feb 2011 17:48:32 -0500
In-Reply-To: <m2tygedxgz.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>>>On m68k, every object by default is at most aligned to a 2 byte
>>>boundary.  That's a heritage of the original Sun m68000 compiler, wh=
ich
>>>served as the template for the gcc configuration for Linux/m68k when=
 the
>>>porting started.
>>
>> Ah, from there. I think it might violate the SYSV ABI, funnily
>> enough (which I've peeked into in order to port elfutils when
>> bored again). Oh the history ;)
>
>I looked into fixing that when I ported m68k from a.out to ELF.
>Unfortunately, that would have broken a big part of the syscall/ioctl
>ABI, so I had to scratch that.

Ah, I understand. I had the breakage in MirBSD with time_t=E2=80=A6
so I don't think anyone could blame you ;)

Nice to know, though. I'll update places like the Debian Wiki.

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success 18:35=E2=8E=9C<asarch> "Psychotics are con=
sistently
inconsistent. The essence of sanity is to be inconsistently inconsisten=
t
