From: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 1/2] amiga floppy: Stop sharing request queue across
 multiple gendisks
Date: Thu, 28 Oct 2010 14:08:53 -0400
Message-ID: <20101028180853.GF30148@redhat.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
 <1285271646-2768-2-git-send-email-vgoyal@redhat.com>
 <AANLkTi=KDqSu8PrR2JbNzwv_Z93G6X5MRqbEiSF9hVgH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:20760 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758192Ab0J1SJK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 28 Oct 2010 14:09:10 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=KDqSu8PrR2JbNzwv_Z93G6X5MRqbEiSF9hVgH@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, axboe@kernel.dk, hch@lst.de, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Oct 28, 2010 at 07:38:33PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 23, 2010 at 21:54, Vivek Goyal <vgoyal@redhat.com> wrote:
> > o Use one request queue per gendisk instead of sharing request queu=
e
> >
> > o Don't have hardware. No compile testing or run time testing done.=
 Completely
> > =C2=A0untested.
> >
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> > =C2=A0drivers/block/amiflop.c | =C2=A0 59 +++++++++++++++++++++++++=
+++++++++++++--------
> > =C2=A01 files changed, 48 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
> > index 76f114f..ead8b77 100644
> > --- a/drivers/block/amiflop.c
> > +++ b/drivers/block/amiflop.c
> > @@ -114,8 +114,6 @@ static unsigned long int fd_def_df0 =3D FD_DD_3=
; =C2=A0 =C2=A0 /* default for df0 if it does
> > =C2=A0module_param(fd_def_df0, ulong, 0);
> > =C2=A0MODULE_LICENSE("GPL");
> >
> > -static struct request_queue *floppy_queue;
> > -
> > =C2=A0/*
> > =C2=A0* =C2=A0Macros
> > =C2=A0*/
> > @@ -164,6 +162,7 @@ static volatile int selected =3D -1; =C2=A0/* c=
urrently selected drive */
> > =C2=A0static int writepending;
> > =C2=A0static int writefromint;
> > =C2=A0static char *raw_buf;
> > +static int fdc_queue;
> >
> > =C2=A0static DEFINE_SPINLOCK(amiflop_lock);
> >
> > @@ -1334,6 +1333,42 @@ static int get_track(int drive, int track)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> > =C2=A0}
> >
> > +/*
> > + * Round-robin between our available drives, doing one request fro=
m each
> > + */
> > +static struct request *set_next_request(void)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 struct request_queue *q;
> > + =C2=A0 =C2=A0 =C2=A0 int cnt =3D FD_MAX_UNITS;
> > + =C2=A0 =C2=A0 =C2=A0 struct request *rq;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 /* Find next queue we can dispatch from */
> > + =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D fdc_queue + 1;
> > + =C2=A0 =C2=A0 =C2=A0 if (fdc_queue =3D=3D FD_MAX_UNITS)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D 0;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 for(cnt =3D FD_MAX_UNITS; cnt > 0, cnt--) {
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unit[fdc_que=
ue].type->code =3D=3D FD_NODRIVE) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (++fdc_queue =3D=3D FD_MAX_UNITS)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D 0;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cotinue;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D unit[fdc_q=
ueue].gendisk->queue;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rq =3D blk_fetch_request(q);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (rq)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (++fdc_queue =
=3D=3D FD_MAX_UNITS)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fdc_queue =3D 0;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > +
> > + =C2=A0 =C2=A0 =C2=A0 return rq;
> > +}
>=20
> drivers/block/amiflop.c:1344: warning: =E2=80=98rq=E2=80=99 may be us=
ed uninitialized
> in this function
> drivers/block/ataflop.c:1402: warning: =E2=80=98rq=E2=80=99 may be us=
ed uninitialized
> in this function
>=20
> Should `rq' just be initialized to NULL? I looked at
> floppy.c:set_next_request(), but it's
> completely different.
>=20

I think we should explicitly initialize rq=3DNULL so that we don't retu=
rn
a garbage value if we can't find any rq to dispatch.

I will send a patch to fix that.=20

Thanks
Vivek
