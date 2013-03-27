From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Wed, 27 Mar 2013 20:02:06 +1300
Message-ID: <5152996E.50800@gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org> <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org> <51515889.6040106@uter.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:63202 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754105Ab3C0HCM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Mar 2013 03:02:12 -0400
Received: by mail-pb0-f51.google.com with SMTP id rr4so2451584pbb.38
        for <linux-m68k@vger.kernel.org>; Wed, 27 Mar 2013 00:02:11 -0700 (PDT)
In-Reply-To: <51515889.6040106@uter.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Wouter Verhelst <w@uter.be>
Cc: Thorsten Glaser <tg@mirbsd.de>, geert@linux-m68k.org, linux-m68k@vger.kernel.org, =?UTF-8?B?SW5nbyBKw7xyZ2Vuc21hbm4=?= <ij@2012.bluespice.org>

Wouter,
>> Sadly, policy allows only stuff that=E2=80=99s in Linus=E2=80=99 tre=
e.
> Nothing says we can't put a kernel with those patches into unreleased
> (or what was it called again?) for the time being...
If that's possible - does anyone have a kernel cross-compile machine se=
t=20
up for that purpose?IJ?
>> But once it went upstream, we can just build a bleeding
>> edge kernel from Debian/experimental with no amount of
>> manual fiddling required.
> That also works, I suppose.
I've split the commit introducing the timer D handling to use=20
handle_simple_irq in the first instance,
and switch to handle_polled_irq in a separate commit. We can leave out=20
that one (and the commit
introducing handle_polled_irq) for upstream submission for now, and=20
revisit the issue once we have
feedback from linux-kernel and linux-netdev. I'd also leave out the USB=
=20
patches for now - the changes
to the ISP116x driver are far too intrusive for my taste.

Geert: only patches touching code outside arch/m68k have to go to=20
linux-netdev?

Next on my TODO: Amiga ESP SCSI (I've let that one sit for too long)

Cheers,

     Michael
