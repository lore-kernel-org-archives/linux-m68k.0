From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] amiga floppy: Stop sharing request queue across
 multiple gendisks
Date: Thu, 28 Oct 2010 19:38:33 +0200
Message-ID: <AANLkTi=KDqSu8PrR2JbNzwv_Z93G6X5MRqbEiSF9hVgH@mail.gmail.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
	<1285271646-2768-2-git-send-email-vgoyal@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41802 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934042Ab0J1Rie convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Oct 2010 13:38:34 -0400
In-Reply-To: <1285271646-2768-2-git-send-email-vgoyal@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux-kernel@vger.kernel.org, axboe@kernel.dk, hch@lst.de, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Sep 23, 2010 at 21:54, Vivek Goyal <vgoyal@redhat.com> wrote:
> o Use one request queue per gendisk instead of sharing request queue
>
> o Don't have hardware. No compile testing or run time testing done. C=
ompletely
> =C2=A0untested.
>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
> =C2=A0drivers/block/amiflop.c | =C2=A0 59 +++++++++++++++++++++++++++=
+++++++++++--------
> =C2=A01 files changed, 48 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
> index 76f114f..ead8b77 100644
> --- a/drivers/block/amiflop.c
> +++ b/drivers/block/amiflop.c
> @@ -114,8 +114,6 @@ static unsigned long int fd_def_df0 =3D FD_DD_3; =
=C2=A0 =C2=A0 /* default for df0 if it does
> =C2=A0module_param(fd_def_df0, ulong, 0);
> =C2=A0MODULE_LICENSE("GPL");
>
> -static struct request_queue *floppy_queue;
> -
> =C2=A0/*
> =C2=A0* =C2=A0Macros
> =C2=A0*/
> @@ -164,6 +162,7 @@ static volatile int selected =3D -1; =C2=A0/* cur=
rently selected drive */
> =C2=A0static int writepending;
> =C2=A0static int writefromint;
> =C2=A0static char *raw_buf;
> +static int fdc_queue;
>
> =C2=A0static DEFINE_SPINLOCK(amiflop_lock);
>
> @@ -1334,6 +1333,42 @@ static int get_track(int drive, int track)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> =C2=A0}
>
> +/*
> + * Round-robin between our available drives, doing one request from =
each
> + */
> +static struct request *set_next_request(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct request_queue *q;
> + =C2=A0 =C2=A0 =C2=A0 int cnt =3D FD_MAX_UNITS;
> + =C2=A0 =C2=A0 =C2=A0 struct request *rq;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Find next queue we can dispatch from */
> + =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D fdc_queue + 1;
> + =C2=A0 =C2=A0 =C2=A0 if (fdc_queue =3D=3D FD_MAX_UNITS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 for(cnt =3D FD_MAX_UNITS; cnt > 0, cnt--) {
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unit[fdc_queue=
].type->code =3D=3D FD_NODRIVE) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (++fdc_queue =3D=3D FD_MAX_UNITS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdc_queue =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cotinue;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D unit[fdc_que=
ue].gendisk->queue;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 rq =3D blk_fetch_request(q);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (rq)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (++fdc_queue =3D=
=3D FD_MAX_UNITS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fdc_queue =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return rq;
> +}

drivers/block/amiflop.c:1344: warning: =E2=80=98rq=E2=80=99 may be used=
 uninitialized
in this function
drivers/block/ataflop.c:1402: warning: =E2=80=98rq=E2=80=99 may be used=
 uninitialized
in this function

Should `rq' just be initialized to NULL? I looked at
floppy.c:set_next_request(), but it's
completely different.

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
