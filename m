From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Mon, 27 Jun 2011 11:49:51 +1200
Message-ID: <BANLkTikDZN3Z-Lc067f2fCaUBon5ugqCqw@mail.gmail.com>
References: <E1QNV5z-0006jD-Ej@franck.debian.org>
	<20110521122605.GA16345@chumley.earth.sol>
	<Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
	<Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
	<BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
	<BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
	<BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
	<BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
	<BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
	<BANLkTikSZQXM3vQt0CCgmb8+rW8CEMKLqQ@mail.gmail.com>
	<m27h8itgp9.fsf@linux-m68k.org>
	<BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:42561 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755833Ab1FZXtw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 26 Jun 2011 19:49:52 -0400
Received: by pwj7 with SMTP id 7so2647975pwj.19
        for <linux-m68k@vger.kernel.org>; Sun, 26 Jun 2011 16:49:51 -0700 (PDT)
In-Reply-To: <BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

Hi All,

after making sure I had a good patch file, the patch applied sort of
cleanly (I had used DEBUG in the stram pool code) and the resulting
kernel runs fine on my Falcon. Geert's resource allocator appears to
do the right thing and provides ST-RAM where needed so the old ST-RAM
allcocator can go.

Thanks a lot, Geert!

Cheers,

  Michael


On Mon, Jun 20, 2011 at 8:08 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> Andreas,
>
> On Sun, Jun 19, 2011 at 7:37 PM, Andreas Schwab <schwab@linux-m68k.or=
g> wrote:
>> Michael Schmitz <schmitzmic@googlemail.com> writes:
>>
>>> http://lkml.org/lkml/2011/6/5/46 appears malformed (patch ending in
>>> the middle of the line),
>>
>> Your browser appears to be broken. =A0Try wget or
>> <http://marc.info/?l=3Dlinux-kernel&m=3D130726658112067&q=3Draw> ins=
tead.
>
> Silly me - for not thinking of wget. Haven't had trouble with that
> browser (whatever Ubuntu 10.04 uses) before though.
>
> Thanks, will retry that!
>
> Cheers,
>
> =A0Michael
>
