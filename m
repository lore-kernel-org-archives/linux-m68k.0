From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(),
	and strnlen_user()
Date: Wed, 30 May 2012 16:04:44 +0200
Message-ID: <20120530140444.GA10543@frolo.macqel>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org> <20120530102226.GA28628@frolo.macqel> <CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

On Wed, May 30, 2012 at 01:20:02PM +0200, Geert Uytterhoeven wrote:
> On Wed, May 30, 2012 at 12:22 PM, Philippe De Muyter <phdm@macqel.be>=
 wrote:
> > On Tue, May 29, 2012 at 11:33:36PM +0200, Geert Uytterhoeven wrote:
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> ---
> >> Do we also want
> >>
> >> =A0 =A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS if (!COLDFIRE && !M=
68000)
> >
> > Sorry, I did not follow what happened to unaligned accesses, but
> > CPU32 family (at least 68340) crashes on unaligned accesses.
>=20
> We don't seem to have CONFIG_M68340 in arch/m68k/Kconfig.cpu?

I have a local port here (but based on an ancient linux kernel, 2.6.2 I=
IRC)

> But Freescale's website confirms both 68340 and 68360 are CPU32.
>=20
> arch/m68k/include/asm/unaligned.h assumes CPU32 (CONFIG_MCPU32)
> can do unaligned accesses:

That's not true.  Accessing a 16- or 32-bit word at an odd address
with a 68340 generates an Address Error Exception.  I remember
discovering a bug in the ppp kernel code because of that.

>=20
> #if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
> #include <linux/unaligned/be_struct.h>
> #include <linux/unaligned/le_byteshift.h>
> #include <linux/unaligned/generic.h>
>=20
> #define get_unaligned   __get_unaligned_be
> #define put_unaligned   __put_unaligned_be
>=20
> #else
> /*
>  * The m68k can do unaligned accesses itself.
>  */
> #include <linux/unaligned/access_ok.h>
> #include <linux/unaligned/generic.h>
>=20
> #define get_unaligned   __get_unaligned_be
> #define put_unaligned   __put_unaligned_be
>=20
> #endif
>=20
> Is this wrong?

I can't tell from reading just the lines above, but I think one should =
add
"|| defined(CONFIG_MCPU32)" at the end of the if condition.

I also think that the Coldfire 5272 can do unaligned accesses, but I
cannot test that at the moment.

>=20
> However, for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
> the question is not whether unaligned accesses are supported, but
> whether they are more efficient than byte copies when copying larger =
blocks.

OK, thanks

Philippe

--=20
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Brux=
elles
