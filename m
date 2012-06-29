From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] m68k: add IO access definitions to support PCI on
 ColdFire platforms
Date: Fri, 29 Jun 2012 07:46:30 +0200
Message-ID: <CAMuHMdW1ZPW7jmAOKmWMmkZdjR1aU4VTLCaVde2d6B4PAZVhNw@mail.gmail.com>
References: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
	<1340947070-10672-4-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:61440 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab2F2Fqa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Jun 2012 01:46:30 -0400
Received: by obbuo13 with SMTP id uo13so4112214obb.19
        for <linux-m68k@vger.kernel.org>; Thu, 28 Jun 2012 22:46:30 -0700 (PDT)
In-Reply-To: <1340947070-10672-4-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 29, 2012 at 7:17 AM,  <gerg@snapgear.com> wrote:
> Define the usual memory access functions (readb/writeb/...) and I/O s=
pace
> functions (inb/outb/...) for PCI bus support on ColdFire CPU based pl=
atforms.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
