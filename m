From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/3] m68k: use some direct calls to ret_from_exception
 in entry code
Date: Sun, 20 May 2012 11:19:44 +0200
Message-ID: <CAMuHMdUhXxnBub4O9Ki1i0Druvdry_AYtHxpih4HJ2QNNBjhvA@mail.gmail.com>
References: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
	<1337314971-11087-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:48872 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009Ab2ETJTp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 05:19:45 -0400
Received: by obbtb18 with SMTP id tb18so6455137obb.19
        for <linux-m68k@vger.kernel.org>; Sun, 20 May 2012 02:19:45 -0700 (PDT)
In-Reply-To: <1337314971-11087-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, May 18, 2012 at 6:22 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The ret_from_excption code is referenced by its function name, or by =
a label
> set at the start of its code. The non-MMU code can share some of this=
 code
> if we make direct calls to ret_from_exception instead of the associat=
ed label.
> The effected function paths are: buserr, trap and ret_from_fork. So c=
hange
> these to branch directly to ret_from_exception.
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
