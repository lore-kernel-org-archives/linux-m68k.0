From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH 00/11] m68knommu: remove ColdFire sub-architecture directories
Date: Wed, 2 May 2012 10:50:03 +0100
Message-ID: <CAGj5WxB2f-4UHK-x=SESX4QqnbfsL0i=LhXoOOZeK2cFhDiQhg@mail.gmail.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:60256 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751686Ab2EBJuF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 May 2012 05:50:05 -0400
Received: by yhmm54 with SMTP id m54so453795yhm.19
        for <linux-m68k@vger.kernel.org>; Wed, 02 May 2012 02:50:03 -0700 (PDT)
In-Reply-To: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: gerg@snapgear.com

Hi Greg,

I've done a similar thing for the 68000 cpu's. Ended up with a single
platform/68000 directory and removed the 68328, 68EZ328 and 68VZ328
directories.

When I have the time I'll prepare the patches and send them (probably
latter today).
I'm not sure if anyone is still building 3.x kernels for the 68[xx]328
SoC's but would be nice if someone could test building the kernel for
the boards using those chips (hopefully I didn't break up anything).
=46or the 68000 (and my board) it's working good.

Regards,
Luis

On Wed, May 2, 2012 at 2:08 AM,  <gerg@snapgear.com> wrote:
>
> Currently the different ColdFire sub-archiectures are split up with a
> directory for each family type. Most though only contain a small amou=
nt
> of code, it just doesn't seem to make any sense to keep them separate=
=2E
>
> Move all the ColdFire sub-architecture code into the platform/coldfir=
e
> directory, and remove the sub-architecture directories. We already bu=
ild
> the common ColdFire components based on sub-architecture type anyway,
> so there is very little Makefile change required.
>
> Overall we remove about 200 lines of duplicated Makefile code, and en=
d
> up with all the ColdFire specific code in a single directory.
>
> ---
>
> =A0arch/m68k/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
0 ----------
> =A0arch/m68k/platform/5206/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/520x/Makefile =A0 =A0 =A0 | =A0 17 ------------=
-----
> =A0arch/m68k/platform/523x/Makefile =A0 =A0 =A0 | =A0 17 ------------=
-----
> =A0arch/m68k/platform/5249/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/5272/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/527x/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/528x/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/5307/Makefile =A0 =A0 =A0 | =A0 20 ------------=
--------
> =A0arch/m68k/platform/532x/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/5407/Makefile =A0 =A0 =A0 | =A0 18 ------------=
------
> =A0arch/m68k/platform/54xx/Makefile =A0 =A0 =A0 | =A0 19 ------------=
-------
> =A0arch/m68k/platform/coldfire/Makefile =A0 | =A0 24 ++++++++++++++--=
--------
> =A0b/arch/m68k/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 --
> =A0b/arch/m68k/platform/coldfire/Makefile | =A0 =A04 ++--
> =A0b/arch/m68k/platform/coldfire/m5206.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m520x.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m523x.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m5249.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m5272.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m527x.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m528x.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m532x.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m5407.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/m54xx.c =A0| =A0 =A01 -
> =A0b/arch/m68k/platform/coldfire/nettel.c | =A0 =A01 -
> =A026 files changed, 16 insertions(+), 234 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
