From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/6] m68k: remove no longer used arch/m68k/lib/string.c
Date: Wed, 30 Mar 2011 20:26:39 +0200
Message-ID: <AANLkTim6QNn=VkOmCoE0s73WBMsKUP=7QgeDz=8BS2m8@mail.gmail.com>
References: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
	<0868d051884e72c38116ab6c89d619050b319ed0.1301471810.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49283 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753728Ab1C3S0k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 14:26:40 -0400
Received: by bwz15 with SMTP id 15so1165440bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 30 Mar 2011 11:26:39 -0700 (PDT)
In-Reply-To: <0868d051884e72c38116ab6c89d619050b319ed0.1301471810.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

On Wed, Mar 30, 2011 at 09:58, Greg Ungerer <gerg@uclinux.org> wrote:
> The last remaining functions in string.c, strcpy() and strcat(), are
> not actually used. They are defined inline in asm/string.h. So remove
> string.h.
  ^^^^^^^^
string.c

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
