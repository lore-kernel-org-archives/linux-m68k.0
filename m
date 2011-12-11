From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove duplicate asm offset for task thread.info
Date: Sun, 11 Dec 2011 10:23:48 +0100
Message-ID: <CAMuHMdWuv8MtwHnUKALZVHhVZVP0VkfH7pCNU=Qk61ViXZTQ9A@mail.gmail.com>
References: <1314940906-31969-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61187 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab1LKJXt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2011 04:23:49 -0500
Received: by wgbdr13 with SMTP id dr13so8972837wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 11 Dec 2011 01:23:48 -0800 (PST)
In-Reply-To: <1314940906-31969-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Sep 2, 2011 at 07:21,  <gerg@snapgear.com> wrote:
> We have a duplicate name and definition for the offset of the thread.=
info
> struct within the task struct in our asm-offsets.c code. Remove one o=
f them,
> and consolidate to use a single define, TASK_INFO.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by:  Geert Uytterhoeven <geert@linux-m68k.org>

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
