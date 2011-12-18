From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] m68k/irq: don't use pr_crit in an header
Date: Sun, 18 Dec 2011 11:42:48 +0100
Message-ID: <20111218104248.GS24496@pengutronix.de>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAMuHMdXyf_ofM+y6yKrzftyKTOyrSKzW7fUVAJyY6XTV_FVhNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-kernel=glddk-debian-kernel=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyf_ofM+y6yKrzftyKTOyrSKzW7fUVAJyY6XTV_FVhNA@mail.gmail.com>
Resent-Message-ID: <CN2QjWhctoP.A.3wH.MPc7OB@liszt>
List-URL: <http://lists.debian.org/debian-kernel/>
List-Post: <mailto:debian-kernel@lists.debian.org>
List-Help: <mailto:debian-kernel-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-kernel-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-kernel-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org, Thorsten Glaser <tg@debian.org>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

(thanks for adding Joe to Cc:, I noticed that when I wanted to add him
myself :-)

On Sun, Dec 18, 2011 at 11:32:21AM +0100, Geert Uytterhoeven wrote:
> 2011/12/17 Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>:
> > Using pr_crit in an header results in funny messages. Consider
> >
> > =A0 =A0 =A0 =A0#define pr_fmt(fmt) "mydriver: " fmt
> > =A0 =A0 =A0 =A0#include <linux/hardirq.h>
> >
> > which makes the message from ack_bad_irq
> >
> > =A0 =A0 =A0 =A0mydriver: unexpected IRQ trap...
> >
> > so better use plain printk with KERN_CRIT directly.
>=20
> Yep, that's expected behavior, as defining pr_fmt() modifies all kernel=
 messages
> generated from that module.
I'm aware it is expected, I only wondered if it is also desirable to
have messages in headers modified depending on the module the header is
included in.
=20
> > This fixes a build problem on m68k with aufs3 en passant because the
> > latter builds with
> >
> > =A0 =A0 =A0 =A0ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s=
[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
> >
> > without providing AUFS_NAME early enough for ack_bad_irq (which is th=
e
> > problem of aufs).
>=20
> Isn't this a problem with (out of tree) aufs?
> Why does it put a define that relies on an (apparently sometimes still
> undefined)
> variable on the build command line?
This is definitily a bug in aufs that needs fixing independant of the
issue of using or not using pr_... in headers.

> Any header may contain calls to pr_*().
>=20
> > Cc: Thorsten Glaser <tg@debian.org>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > =A0arch/m68k/include/asm/hardirq.h | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/=
hardirq.h
> > index db30ed2..1f652e0 100644
> > --- a/arch/m68k/include/asm/hardirq.h
> > +++ b/arch/m68k/include/asm/hardirq.h
> > @@ -20,7 +20,7 @@
> >
> > =A0static inline void ack_bad_irq(unsigned int irq)
> > =A0{
> > - =A0 =A0 =A0 pr_crit("unexpected IRQ trap at vector %02x\n", irq);
> > + =A0 =A0 =A0 printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n"=
, irq);
>=20
> Nack. Nowadays pr_crit(...) is recommended over "printk(KERN_CRIT ...)"=
.
I know that, I just wonder if the proponents of this recommendation are
aware of the issue when using pr_* in headers. Joe?
=20
> Besides, there are (albeit not that many yet) other callers of pr_*() i=
n
> header files. Do you plan to revert them to printk(), too?
That depends on the outcome of this discussion.

> Please fix aufs instead. Thanks!
I already provided a patch for that, too. (Currently only on the Debian
kernel ML.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|


--=20
To UNSUBSCRIBE, email to debian-kernel-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
Archive: http://lists.debian.org/20111218104248.GS24496@pengutronix.de
