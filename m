From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Tue, 18 Jan 2011 08:50:14 +1300
Message-ID: <AANLkTi=O2C5keqTm3Q4w8_T1Z=Dd68CAPSe-FaWt_h_x@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:47073 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab1AQTxp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2011 14:53:45 -0500
Received: by wwa36 with SMTP id 36so5672589wwa.1
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2011 11:53:43 -0800 (PST)
In-Reply-To: <AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,

On Mon, Jan 17, 2011 at 7:51 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jan 17, 2011 at 03:48, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>>>>Mmh - Geert's 2.6.37 does work just fine for me; I'll better get yo=
ur
>>>>patches applied to a vanilla kernel and see how that differs from
>>>>2.6.37-m68k. vanilla plus the git branch m68k-queue _should_ just g=
et
>>>>us to 2.6.37-m68k, right?
>>>
>>> I applied all of m68k-queue and for-linus of that day (which is the
>>> signal patchset for both m68ks and the rest of the queue) but on to=
p
>>> of a 2.6.37-1~experimental.1 Debian kernel.
>>
>> for-linus is what I would have missed ...
>
> for-linus is a always[*] subset of m68k-queue, so you can ignore it.

Good - I've unpacked the 2.6.37.experimental source and ran
dpkg-buildpackage -b -am68k on it up to the point where it fails
because I haven't got a cross-gcc-4.4 installed (flavors restricted to
atari only!). At that point, to my limited understanding of the kernel
build process, all patched ought to have been applied.

The good news is that the Atari SCSI driver is up to the latest git
version. But we had discounted that option already anyway.

The only patch that has been missed, but may be relevant for Atari stil=
l:

16 bit FAT default for GEMDOS:

--- linux-m68k-git/linux-m68k/fs/fat/inode.c    2010-11-10
19:40:40.131506952 +1300
+++ linux-2.6-2.6.37/debian/build/source_m68k_none/fs/fat/inode.c
 2011-01-17 20:18:44.484006839 +1300
@@ -923,10 +923,10 @@
        {Opt_err_cont, "errors=3Dcontinue"},
        {Opt_err_panic, "errors=3Dpanic"},
        {Opt_err_ro, "errors=3Dremount-ro"},
+       {Opt_discard, "discard"},
        {Opt_atari_yes, "atari=3Dyes"},
        {Opt_atari_yes, "atari"},
        {Opt_atari_no, "atari=3Dno"},
-       {Opt_discard, "discard"},
        {Opt_obsolate, "conv=3Dbinary"},
        {Opt_obsolate, "conv=3Dtext"},
        {Opt_obsolate, "conv=3Dauto"},

I'd suggest I first test that this option is still required - will
have to sacrifice a spare SCSI disk for that.

So for all intents and purposes, Thorsten and I are using the same
source. I will still build the patched Debian source using my
toolchain, but I just cannot see why it would not work.

>>> Heh well. I=92ve had fun times buying an IDE drive with less than 1=
024
>>> cylinders, floppies, and printer paper (not loose pages like copier
>>> paper they use nowadays, no, real 21x30.48cm endless paper) too ;-)
>>
>> Floppies is a dark chapter indeed. I salvage floppies wherever I fin=
d
>> them. Will see about the 1024 cylinder limit though.
>
> Guys, what are you smoking?

I gave up smoking  quite a few years back :-)

> I was pleasantly surprised when my Amiga detected a "540 MB" drive, a=
s the
> one I bought was advertised as a "524 MB" drive. Turned out due to MS=
-DOS
> supporting only 1024 cylinders, while the Amiga saw 1057 ;-)
> I have to admit I bought this drive in 1993, not yesterday.

Slightly difficult to get a 540 MB drive anywhere these days - even
USB memory sticks have outgrown the MB range for a while now :-)

Currently in use on the Falcon:

hda: 2814336 sectors (1440 MB) w/128KiB Cache, CHS=3D2792/16/63

So I should not need to worry about the cylinder numbers ...

Cheers,

  Michael
