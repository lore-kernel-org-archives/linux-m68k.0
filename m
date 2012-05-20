From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68knommu: reorganize the no-MMU cache flushing to
 match m68k
Date: Sun, 20 May 2012 11:07:17 +0200
Message-ID: <CAMuHMdX48_zgpkRcVwOjLG6ahqZJ8wfLzX0QxhoyWVzh2ZBH+w@mail.gmail.com>
References: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
	<1336114247-22764-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:54354 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609Ab2ETJHR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 05:07:17 -0400
Received: by mail-ob0-f174.google.com with SMTP id tb18so6444309obb.19
        for <linux-m68k@vger.kernel.org>; Sun, 20 May 2012 02:07:17 -0700 (PDT)
In-Reply-To: <1336114247-22764-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, May 4, 2012 at 8:50 AM,  <gerg@snapgear.com> wrote:
> In particular by reorganizing the __flush_caceh_all() code and separa=
ting

__flush_cache_all()

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
