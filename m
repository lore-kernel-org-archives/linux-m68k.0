From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/6] m68k: merge and clean up files in m68k/lib
Date: Wed, 30 Mar 2011 20:41:21 +0200
Message-ID: <AANLkTi=KoiaabjifdcB+YC1hiE9mb+CJz07Xfn588j7e@mail.gmail.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:42091 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754711Ab1C3SlX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 14:41:23 -0400
Received: by bwz15 with SMTP id 15so1175215bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 30 Mar 2011 11:41:22 -0700 (PDT)
In-Reply-To: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Hi Greg,

On Wed, Mar 30, 2011 at 09:58, Greg Ungerer <gerg@uclinux.org> wrote:
> The following set of patches cleans up and merges individual files in
> the arch/m68k/lib directory. Mostly strait forward stuff,
>
> I have build and run tested on ARAnyM/Atari and ColdFire (non-mmu)
> targets.

Thanks! Looks good! Haven't tested it yet, though (see below).

> Not sure why git/diff mangled some of these a little. The changes to
> patche 5, string.h, are simpler than it looks... These where generate=
d
> with "git format-patch -M -B" to make it easier to review the file
> movements.

Patch 1:

| Applying: m68k: merge mmu and non-mmu versions of muldi3
| error: arch/m68k/lib/muldi3.c: already exists in index
| Patch failed at 0001 m68k: merge mmu and non-mmu versions of muldi3
| When you have resolved this problem run "git am --resolved".
| If you would prefer to skip this patch, instead run "git am --skip".
| To restore the original branch and stop patching run "git am --abort"=
=2E

Doing "git rm arch/m68k/lib/muldi3.c && git commit -a" first fixes it.

Patch5:

| Applying: m68k: remove duplicate memcpy() implementation
| error: arch/m68k/lib/string.c: has been deleted/renamed
| Patch failed at 0001 m68k: remove duplicate memcpy() implementation
| When you have resolved this problem run "git am --resolved".
| If you would prefer to skip this patch, instead run "git am --skip".
| To restore the original branch and stop patching run "git am --abort"=
=2E

Doing "git rm arch/m68k/lib/string.c && git commit -a" did not fix it :=
-(

Any chance you can send a "normal" patch, or a place to pull from?

Anyway, I did a thorough review, so consider it
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
