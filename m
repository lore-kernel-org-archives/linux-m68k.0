From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: Re: [PATCH 5/5] m68k: merge non-mmu and mmu
	versions of m68k_ksyms.c
Date: Thu, 21 Apr 2011 10:32:34 +0200
Message-ID: <20110421083234.GC23491@frolo.macqel>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
	<1303346890-28249-2-git-send-email-gerg@snapgear.com>
	<1303346890-28249-3-git-send-email-gerg@snapgear.com>
	<1303346890-28249-4-git-send-email-gerg@snapgear.com>
	<1303346890-28249-5-git-send-email-gerg@snapgear.com>
	<1303346890-28249-6-git-send-email-gerg@snapgear.com>
	<BANLkTikwQZXjzXEZma41+Z0x4JRjZ1c6Dg@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikwQZXjzXEZma41+Z0x4JRjZ1c6Dg@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, Apr 21, 2011 at 10:16:01AM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 21, 2011 at 02:48,  <gerg@snapgear.com> wrote:
> > +#ifndef CONFIG_MMU
>=20
> While we're at it, that should also be a test for not '020-'060/CPU32?

You beat me on this :)

You're abolutely right, we may not test on CONFIG_MMU for mmu-capable
coldfires, but which do lack 32x32->64 mulu and friends.

>=20
> > +/*
> > + * Simpler 68k and ColdFire parts also need a few other gcc function=
s.
> > + */
> > +extern long long __divsi3(long long, long long);
> > +extern long long __modsi3(long long, long long);
> > +extern long long __mulsi3(long long, long long);
> > +extern long long __udivsi3(long long, long long);
> > +extern long long __umodsi3(long long, long long);
> > +
> > +EXPORT_SYMBOL(__divsi3);
> > +EXPORT_SYMBOL(__modsi3);
> > +EXPORT_SYMBOL(__mulsi3);
> > +EXPORT_SYMBOL(__udivsi3);
> > +EXPORT_SYMBOL(__umodsi3);
> > =A0#endif

Philippe
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
