From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/2] m68k: correct the Atari ALLOWINT definition
Date: Mon, 23 Apr 2012 12:51:21 +1200
Message-ID: <CAOmrzkJ6obnasbddRnA3kC4JWtsT9TrQvj_t_6RKCKxbJtEiCQ@mail.gmail.com>
References: <20367.17904.199202.88993@pilspetsen.it.uu.se>
	<4F8FDB16.3020502@gmail.com>
	<20367.61713.46772.272638@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58526 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753062Ab2DWAvW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Apr 2012 20:51:22 -0400
Received: by pbcun15 with SMTP id un15so3229754pbc.19
        for <linux-m68k@vger.kernel.org>; Sun, 22 Apr 2012 17:51:22 -0700 (PDT)
In-Reply-To: <20367.61713.46772.272638@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-m68k@vger.kernel.org

Mikael,

On Thu, Apr 19, 2012 at 11:03 PM, Mikael Pettersson <mikpe@it.uu.se> wr=
ote:
> Michael Schmitz writes:
> =A0> Mikael Pettersson wrote:
> =A0> > The fix is simple: define ALLOWINT as ~0x500 instead. =A0This =
makes
> =A0> > arch_local_irq_enable() consistent with default_idle(), and pr=
events
> =A0> > the !irqs_disabled() problems for ipl 3 interrupts.
> =A0> >
> =A0> > Tested on Atari running in an Aranym VM.
> =A0> >
> =A0> Tested on my Falcon/CT60.
>
> Thanks. =A0May I add an explicit
>
> Tested-by: Michael Schmitz <schmitzmic@googlemail.com> (on Falcon/CT6=
0)
>
> to the patch description?

By all means - feel free to do that. Thanks for catching this one -
I've not had time for much more than quickly booting the kernel and
poking around a bit to make sure network and the like are alive but
I've got a hunch that this may resolve keyboard overruns that I did
very sporadically see in the 3.x series.

Thanks again,

  Michael
