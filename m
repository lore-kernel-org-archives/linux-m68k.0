From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Sun, 16 Jan 2011 17:36:45 +1300
Message-ID: <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35278 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754449Ab1APEgr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 15 Jan 2011 23:36:47 -0500
Received: by wyb28 with SMTP id 28so4117664wyb.19
        for <linux-m68k@vger.kernel.org>; Sat, 15 Jan 2011 20:36:46 -0800 (PST)
In-Reply-To: <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Geert,

>> Ouch, just had a peek at the atari kernel which was built overnight
>> (it=92s working on bvme now) and got this:
>>
>> Running Aranym on X11: :0.0
>> ARAnyM 0.9.10
>
>
>> [ =A0 =A00.000000] Linux version 2.6.37-0+m68k.1-atari (Debian 2.6.3=
7-1~experimental.1+m68k.1) (tg@mirbsd.de) (gcc version 4.4.5 (Debian 4.=
4.5-10) ) #1 Fri Jan 14 06:21:53 UTC 2011
>
>> [ =A0 =A03.120000] scsi: waiting for bus probes to complete ...
>> [ =A0 =A03.390000] Unable to handle kernel NULL pointer dereference =
at virtual address =A0 (null)
>
> Interesting, 2.6.37 with the m68k patches runs fine on ARAnyM for me.=
=2E.

Ditto - both 2.6.37rc1 and 2.6.37 worked fine on ARAnyM. rc1 runs fine
on the actual hardware (stram pool patch applied).  Aside from that,
and the outdatet-toolchain related issues, I have no other patches
applied.

> There may be issues on real hardware though, as there's still a
> half-finished patch
> for SCSI from Michael pending.

It seems as though that's not a real issue anymore. I have backed that
patch out (or rather, had to restart with a fresh git clone a way back
and haven't reactivated that patch yet) but someone else appears to
have worked on atari_NCR5380.c and imported changes that implement
proper request locking. Mounting the SCSI disks readonly I could not
get the SCSI driver to deadlock yet.

The reference to slab allocation in the above error message does ring
a bell - a colleague has panics that look kinda similar (Intel
hardware running virtual machines there). Does look like the kernel
can get out of memory without the proper plugs being pulled (my gut
feeling). I'll have to look into that some more. Maybe play with
memory or ST-RAM pool size in ARAnyM.

Can you send me a copy of that kernel image so I can give it a try on
my working ARAnyM config, Thorsten?

(on the buildd chroot image test: had to discover the spare IDE disk I
used for tests has died; need to get a new one finally)

Cheers,

  Michael

>
> Gr{oetje,eeting}s,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0 -- =
Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
