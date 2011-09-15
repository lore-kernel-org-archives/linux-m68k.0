From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: 68000 patches (Atari ST platform)
Date: Thu, 15 Sep 2011 13:53:47 +0200
Message-ID: <CAMuHMdWYN5cBrhz1djo34pDFPPwpNUnjURMO7pe1Ntmw3hgsow@mail.gmail.com>
References: <20110911230920.GA1541@matze-K8NF4G-SATA2>
	<CAOmrzk+sqAzh48zXOKQ06iRhceJMTZvPJiDDTASgmT1Qv1B-7Q@mail.gmail.com>
	<loom.20110915T134159-512@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:50334 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933075Ab1IOLxs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Sep 2011 07:53:48 -0400
Received: by iaqq3 with SMTP id q3so1110186iaq.19
        for <linux-m68k@vger.kernel.org>; Thu, 15 Sep 2011 04:53:48 -0700 (PDT)
In-Reply-To: <loom.20110915T134159-512@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Thu, Sep 15, 2011 at 13:45, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michael Schmitz <schmitzmic <at> googlemail.com> writes:
>
>> ataboot used to be part of the m68k CVS on kullervo.debian.net but w=
e
>> have had to take kullervo offline half a year ago. Christian has
>> rebuilt the system but we're still having trouble with the ethernet
>> driver in 3.1 (sort of working on this). I'm sure we can clone the
>> m68k CVS off kullervo and set it up somewhere else.
>
> Ah, there they are ;) I=E2=80=99ve NMU=E2=80=99d the m68k bootstraps =
(Atari, Amiga, VMS,
> Mac except where shared with macppc) in Debian to get their source up=
loaded
> to unreleased (since they were removed from unstable), and wondered a=
bout
> them. (And the packaging is positively ancient, understandably.)
>
> I could host them (I love CVS, after all, *and* I maintain CVS in Deb=
ian,
> and use it a lot in BSD=E2=80=A6) if you want, and can arrange for co=
mmit access
> for selected people (tell me whom, and I need a PGP trust path) inclu=
ding
> mails (with or (default) without diffs sent inline). I can put it on =
my
> box at home (P-233MMX with an actual Hercules Graphics Card, behind A=
DSL)
> or put a separate repo on another box, whatever is your preference.

I think I have a git clone at home...

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert - no - more - CVS

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
