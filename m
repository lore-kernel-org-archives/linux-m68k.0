From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Mon, 17 Jan 2011 10:26:30 +1300
Message-ID: <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:49565 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753752Ab1APVbm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Jan 2011 16:31:42 -0500
Received: by wyb28 with SMTP id 28so4539200wyb.19
        for <linux-m68k@vger.kernel.org>; Sun, 16 Jan 2011 13:31:36 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Thorsten,

>>The reference to slab allocation in the above error message does ring
>>a bell - a colleague has panics that look kinda similar (Intel
>>hardware running virtual machines there). Does look like the kernel
>>can get out of memory without the proper plugs being pulled (my gut
>
> Oh, ouch.

Might well be something different - upon closer inspection, the errors
look different at least.

>>feeling). I'll have to look into that some more. Maybe play with
>>memory or ST-RAM pool size in ARAnyM.
>
> Well, I do have a large number of patches applied (all of Debian=92s
> and the entire m68k queue)=85

Mmh - Geert's 2.6.37 does work just fine for me; I'll better get your
patches applied to a vanilla kernel and see how that differs from
2.6.37-m68k. vanilla plus the git branch m68k-queue _should_ just get
us to 2.6.37-m68k, right?

>>Can you send me a copy of that kernel image so I can give it a try on
>>my working ARAnyM config, Thorsten?
>
> Sure: https://pfau.mirbsd.org/~tg/pub/vmlinux.gz

Thanks, I'll try that one. 2.6.37-m68k (built as a minimal config so
it will fit on a floppy) does run OK on the Falcon right now, though I
had a weird IDE kernel panic with 2.6.37-rc1-m68k the other day.
=46loppy detection has been a bit shaky on that one, and SCSI must have
had some weird issues as well - could not mount one of the SCSI
partitions whatever I tried, it always reported the device busy.
2.6.37-m68k would open the partition fine.

>>(on the buildd chroot image test: had to discover the spare IDE disk =
I
>>used for tests has died; need to get a new one finally)
>
> Ah okay. Good luck anyway=85

Thanks - just a matter to drive out to a decent shop after work
sometime. Not something the consumer electronics shops in Auckland CBD
stock, for some reason.

Cheers,

  Michael
