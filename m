From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mac68k: fix mac_irq_pending() for PSC MACE and SCC
Date: Sat, 13 Aug 2011 19:57:17 +0200
Message-ID: <CAMuHMdWnZQMgogPRMXPW1xZAuZ1a-4a-57BxK97Y_BU=fGz2CA@mail.gmail.com>
References: <alpine.OSX.2.00.1107181939190.145@ibook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:54845 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab1HMR5S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 13:57:18 -0400
Received: by iye16 with SMTP id 16so4017317iye.1
        for <linux-m68k@vger.kernel.org>; Sat, 13 Aug 2011 10:57:18 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1107181939190.145@ibook.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Mon, Jul 18, 2011 at 11:44, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> Add missing return statement. The docs say that the level 4 PSC IRQs
> relate to MACE DMA and SCC. Since those drivers don't call
> mac_irq_pending() this patch has no affect. But it should be fixed al=
l the
> same, since it can be useful for MACE debugging.

Thanks, applied. Will queue for 3.2.

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
