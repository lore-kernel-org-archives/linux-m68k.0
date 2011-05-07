From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of
	sys_call_table
Date: Sat, 7 May 2011 10:34:25 +0200
Message-ID: <BANLkTinssNTc_+=F4CA1Znb3bdv=c30OPw@mail.gmail.com>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
	<19907.2804.330120.193924@pilspetsen.it.uu.se>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <19907.2804.330120.193924@pilspetsen.it.uu.se>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, May 5, 2011 at 22:39, Mikael Pettersson <mikpe@it.uu.se> wrote:
> Geert Uytterhoeven writes:
> =C2=A0> On Thu, 5 May 2011, Arnd Bergmann wrote:
> =C2=A0> > Did you check the macros in unistd to see if they match the
> =C2=A0> > actual table? I guess it would be a good time to comment out
> =C2=A0> > the ones that are not implemented in either of the two ABIs.
> =C2=A0>
> =C2=A0> Like this?
> =C2=A0>
> =C2=A0> warning: #warning syscall pselect6 not implemented
> =C2=A0> warning: #warning syscall ppoll not implemented
> =C2=A0> warning: #warning syscall recvmmsg not implemented
> =C2=A0>
> =C2=A0> Do we need pselect6 and ppoll? I have vague memories not requirin=
g it.
>
> They close user-space race conditions, so you want them.

So do you recommend to backport the wiring up of pselect6/ppoll to -stable?
We always had their _NR_* defines, so I guess glibc was always compiled
with pselect6/ppoll support, and will use it if it's present.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
