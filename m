From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] fix amiga and atari floppy driver compile warning
Date: Thu, 28 Oct 2010 20:46:18 +0200
Message-ID: <AANLkTikOV04gMrjxwFfm0+hHft2uQ2wbTro-OrzrohnS@mail.gmail.com>
References: <20101028184223.GG30148@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:44045 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755776Ab0J1SqT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Oct 2010 14:46:19 -0400
In-Reply-To: <20101028184223.GG30148@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Jens Axboe <jaxboe@fusionio.com>, linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org, hch@lst.de

On Thu, Oct 28, 2010 at 20:42, Vivek Goyal <vgoyal@redhat.com> wrote:
> Geert, my crosstool don't produce warning below. I guess this has to =
do
> something with compiler version.
>
> - Geert noticed following warning during compilation.
>
> =C2=A0drivers/block/amiflop.c:1344: warning: =E2=80=98rq=E2=80=99 may=
 be used uninitialized in
> =C2=A0this function
> =C2=A0drivers/block/ataflop.c:1402: warning: =E2=80=98rq=E2=80=99 may=
 be used uninitialized in
> =C2=A0this function
>
> - Initialize rq to NULL to fix the warning. If we can't find a suitab=
le request
> =C2=A0to dispatch, this function should return NULL instead of a poss=
ibly garbage
> =C2=A0pointer.

Thanks, gcc version 4.1.2 20061115 now no longer gives a warning.

> - Cross compile tested only. Don't have hardware to test it.

=46loppy hardware in bad state here :-(

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
> =C2=A0drivers/block/amiflop.c | =C2=A0 =C2=A02 +-
> =C2=A0drivers/block/ataflop.c | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> Index: linux-2.6/drivers/block/amiflop.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/block/amiflop.c =C2=A0 =C2=A0 =C2=A02010-1=
0-28 14:32:25.000000000 -0400
> +++ linux-2.6/drivers/block/amiflop.c =C2=A0 2010-10-28 14:34:11.0000=
00000 -0400
> @@ -1341,7 +1341,7 @@ static struct request *set_next_request(
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct request_queue *q;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int cnt =3D FD_MAX_UNITS;
> - =C2=A0 =C2=A0 =C2=A0 struct request *rq;
> + =C2=A0 =C2=A0 =C2=A0 struct request *rq =3D NULL;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find next queue we can dispatch from */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fdc_queue =3D fdc_queue + 1;
> Index: linux-2.6/drivers/block/ataflop.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/block/ataflop.c =C2=A0 =C2=A0 =C2=A02010-1=
0-28 14:31:21.000000000 -0400
> +++ linux-2.6/drivers/block/ataflop.c =C2=A0 2010-10-28 14:33:58.0000=
00000 -0400
> @@ -1399,7 +1399,7 @@ static struct request *set_next_request(
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct request_queue *q;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int old_pos =3D fdc_queue;
> - =C2=A0 =C2=A0 =C2=A0 struct request *rq;
> + =C2=A0 =C2=A0 =C2=A0 struct request *rq =3D NULL;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0do {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D unit[fdc=
_queue].disk->queue;
>

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
