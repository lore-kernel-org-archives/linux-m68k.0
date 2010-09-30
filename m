From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 08:07:05 +0200
Message-ID: <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44287 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492Ab0I3GHG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 02:07:06 -0400
Received: by iwn5 with SMTP id 5so2010153iwn.19
        for <linux-m68k@vger.kernel.org>; Wed, 29 Sep 2010 23:07:05 -0700 (PDT)
In-Reply-To: <20100930055823.GK19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Al,

On Thu, Sep 30, 2010 at 07:58, Al Viro <viro@zeniv.linux.org.uk> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0I've been trying to sort out what's going =
on with TIF_DELAYED_TRACE,
> but unfortunately neither User's Manual for 68040 nor Programmer's Re=
ference
> Manual for 68k family cover tracing exceptions in enough details ;-/
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0a) regs.SR.T1 is cleared if you have creat=
ed a sigframe; in
> addition, SIGTRAP is sent to yourself.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0b) if you leave a syscall and see TIF_DELA=
YED_TRACE set, you
> do the same thing, signals or no signals.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0c) if you leave an exception *and* no sign=
al handlers are triggered,
> you leave T1 alone.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0d) if you step into a tracing exception, y=
ou get SIGTRAP again,
> with si_code set to TRAP_TRACE (instead of SI_KERNEL); si_addr is set
> (unlike the previous cases).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0e) TIF_DELAYED_TRACE is set when you ask f=
or singlestepping;
> the same thing sets SR.T1.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0f) PTRACE_POKEUSR can't change tracing bit=
s in SR; neither can
> sigreturn.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0g) if UM is clear on anything, it's that f=
or TRAP the tracing
> exception is handled before entering the trap itself.
>
> So what's that SIGTRAP on exit from syscall in single-stepping mode f=
or?
> I can understand doing that when we've set a signal handler up, but..=
=2E
>
> There'd been some changes of behaviour in cset with rather uninformat=
ive
> commit message
> =C2=A0 =C2=A0[PATCH] M68k update (part 42)
> =C2=A0 =C2=A0M68k task and thread updates
> and AFAICS until that point we had the same "send SIGTRAP and clear T=
1" on
> ret_from_exception, no matter what had led there. =C2=A0Was that a bu=
gfix or
> just an unintended change?
>
> BTW, there's a bunch of signal races in m68k, mostly parallel to simi=
lar
> crap I'd been fixing lately on other targets; I have fixes, but I'd r=
ather
> understand what's going on with tracing in there before touching the
> more subtle ones...

Sorry, I don't know. I try to stay away from the signal code as much
as possible.

Perhaps Andreas knows?

Anyway, thanks for looking into this!

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
