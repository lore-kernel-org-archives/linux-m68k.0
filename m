From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Wed, 19 Jan 2011 08:59:19 +0100
Message-ID: <AANLkTim9MQLK1BtGT1jEXn-=jV47HE-2yWCtJ9VOQkza@mail.gmail.com>
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
	<AANLkTinqCexLUjNxgSmkphx-oMVgz27b2GH1n2NVNU2n@mail.gmail.com>
	<AANLkTimWyj2HriMd3mpPgc1Mu9RWb8fyPiKrVWfs=4+t@mail.gmail.com>
	<AANLkTim32Xs+ajq1fWiDae9dZ-n0HD-5bJYOr31gwabP@mail.gmail.com>
	<AANLkTi=hMc5uKbWRHQkyPe30my1NzYpa7p-OB5_24=Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:52246 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569Ab1ASH7V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Jan 2011 02:59:21 -0500
Received: by fxm20 with SMTP id 20so565274fxm.19
        for <linux-m68k@vger.kernel.org>; Tue, 18 Jan 2011 23:59:20 -0800 (PST)
In-Reply-To: <AANLkTi=hMc5uKbWRHQkyPe30my1NzYpa7p-OB5_24=Xw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Wed, Jan 19, 2011 at 00:54, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> In other news, SCSI on the Falcon is still broken - timeouts for SCSI
> commands are started by the block layer, but commands cannot be
> guaranteed to get queued in the lowlevel driver unless the lowlevel
> driver has access to the SCSI DMA right away. Upon timeout, the
> request isn't actually found on the lowlevel queue in case the queue
> request had to wait. I'm unsure what the correct strategy is here:
> defer queueing requests by pretending the driver is busy, or queue
> requests and try to kick off the coroutine as soon as DMA gets
> available?

I guess pretending the driver is busy?
The alternative means duplicating request queueing, which people will f=
rown
upon.

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
