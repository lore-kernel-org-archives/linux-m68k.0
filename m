From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Mon, 17 Jan 2011 21:14:41 +0100
Message-ID: <AANLkTinqCexLUjNxgSmkphx-oMVgz27b2GH1n2NVNU2n@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
	<AANLkTi=O2C5keqTm3Q4w8_T1Z=Dd68CAPSe-FaWt_h_x@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:54480 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816Ab1AQUOm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2011 15:14:42 -0500
Received: by fxm20 with SMTP id 20so6435955fxm.19
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2011 12:14:41 -0800 (PST)
In-Reply-To: <AANLkTi=O2C5keqTm3Q4w8_T1Z=Dd68CAPSe-FaWt_h_x@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, Jan 17, 2011 at 20:50, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> The only patch that has been missed, but may be relevant for Atari st=
ill:
>
> 16 bit FAT default for GEMDOS:
>
> --- linux-m68k-git/linux-m68k/fs/fat/inode.c =C2=A0 =C2=A02010-11-10
> 19:40:40.131506952 +1300
> +++ linux-2.6-2.6.37/debian/build/source_m68k_none/fs/fat/inode.c
> =C2=A02011-01-17 20:18:44.484006839 +1300
> @@ -923,10 +923,10 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_err_cont, "errors=3Dcontinue"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_err_panic, "errors=3Dpanic"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_err_ro, "errors=3Dremount-ro"},
> + =C2=A0 =C2=A0 =C2=A0 {Opt_discard, "discard"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_atari_yes, "atari=3Dyes"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_atari_yes, "atari"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_atari_no, "atari=3Dno"},
> - =C2=A0 =C2=A0 =C2=A0 {Opt_discard, "discard"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_obsolate, "conv=3Dbinary"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_obsolate, "conv=3Dtext"},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{Opt_obsolate, "conv=3Dauto"},

The order of the options shouldn't matter. Due to historical reasons,
it's different
on master and m68k-queue.

> I'd suggest I first test that this option is still required - will
> have to sacrifice a spare SCSI disk for that.

I think there was a half consensus or so that we still need it, but
not enough to
put some weight behind it ;-)

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
