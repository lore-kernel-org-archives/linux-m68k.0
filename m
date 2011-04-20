From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH v2 1/6] m68k: merge mmu and non-mmu
	versions of muldi3
Date: Wed, 20 Apr 2011 11:12:16 +0200
Message-ID: <20110420091216.GB3296@frolo.macqel>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
	<1303278880-16153-2-git-send-email-gerg@snapgear.com>
	<1303278880-16153-3-git-send-email-gerg@snapgear.com>
	<20110420080609.GA24244@merkur.ravnborg.org>
	<BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com>
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

On Wed, Apr 20, 2011 at 10:55:15AM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 20, 2011 at 10:06, Sam Ravnborg <sam@ravnborg.org> wrote:
> > Hi Greg.
> >
> >> +
> >> +#if defined(__mc68020__) || defined(__mc68030__) || \
> >> + =A0 =A0defined(__mc68040__) || defined(__mc68060__)
> >
> > Why use these to decide if this is MMU or not?
> > This code is not exposed to user-space so we can rely on CONFIG_* sym=
bols.
> > IMO the CONIFG_* symbols is easier to read/maintain.
>=20
> Because technically it doesn't depend on having a MMU or not, but on ha=
ving
> the full 32-bit multiplication instruction or not.
>=20
> Does Coldfire-with-MMU (for which we haven't integrated the support
> yet) have that
> instruction?

Actually, MCF547x & MCF548x (CFv4e family) are integrated but without the=
ir
limited MMU functionality.

freescale had even written an mmu port for 2.6.25 but has not pushed it
upstream.  This port can be found on their site or in the openwrt reposit=
ory.

MCF547x & MCF548x do not have that instruction.

Philippe
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
