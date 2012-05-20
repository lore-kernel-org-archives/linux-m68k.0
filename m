From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: What ISA hardware is integrated into m68k bridges
Date: Mon, 21 May 2012 09:10:49 +1200
Message-ID: <CAOmrzk+hWvu8L51JXogwj6A=KFsj_nu_UX2qS_HABxyks-8srw@mail.gmail.com>
References: <20120520163105.GC21177@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43146 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736Ab2ETVKu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 17:10:50 -0400
Received: by pbbrp8 with SMTP id rp8so6089252pbb.19
        for <linux-m68k@vger.kernel.org>; Sun, 20 May 2012 14:10:49 -0700 (PDT)
In-Reply-To: <20120520163105.GC21177@windriver.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Paul,

On Mon, May 21, 2012 at 4:31 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Geert,
>
> A discussion is underway with respect to the future of the various IS=
A
> drivers[1], and Alan suggested checking with the m68k folks:
>
> =A0Check with the M68K people however. 3c501 won't matter to them but=
 I'm
> =A0not sure which of the other chips ended up on Amiga ISA bridges. I=
 know
> =A0NE2000 clones did.
>
> I know you've currently got that "almost ne2k" driver that runs IRQ-l=
ess. =A0Are
> there other "ISA-like" onboard devices in the M68k harware scope that=
 rely on
> existing (x86) ISA drivers?

Not sure it's still considered ISA based in its current state, but the
smc91x is another one used on Atari. That one's got an interrupt
though, and I had confirmation that it works fine from a user just a
few days ago.

You mentioned the IRQ-less ne2k already - making that one run on
netpoll has stalled for now because I'm too busy at work. Neither
driver has been merged mainstream yet.

Most of the Amiga cards are 8390 or Lance based IIRC (there's a Lance
based Atari driver as well!) but these do not share code with the ISA
Lance drivers as far as I can see. Geert may know more details.

Cheers,

  Michael
