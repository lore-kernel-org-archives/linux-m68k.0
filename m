From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Thu, 3 Nov 2011 09:28:13 +0100
Message-ID: <CAMuHMdUCzjkGL_Z3ki9nNrreL_+hxa2dwLZZ+LLB250w4UfYNA@mail.gmail.com>
References: <1320299645-9105-1-git-send-email-gerg@snapgear.com>
	<1320299645-9105-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:38428 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755086Ab1KCI2P convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 04:28:15 -0400
Received: by faao14 with SMTP id o14so1248875faa.19
        for <linux-m68k@vger.kernel.org>; Thu, 03 Nov 2011 01:28:13 -0700 (PDT)
In-Reply-To: <1320299645-9105-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Nov 3, 2011 at 06:54,  <gerg@snapgear.com> wrote:
> The ColdFire FPU is of course different to all previous 68k FP units.=
 It is
> close in operation to the 68060, but not completely compatible. The b=
iggest
> issue to deal with is that the ColdFire FPU multi-move instructions a=
re
> different. It does not support multi-moving the FP control registers,=
 and
> the multi-move of the FP data registers uses a different instruction
> neumonic.

mnemonic

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
