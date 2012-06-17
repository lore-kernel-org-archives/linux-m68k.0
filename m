From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while
 OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 23:15:39 +0200
Message-ID: <CAMuHMdVEq3RrQVJF9RgyC7UH-VAcWK=9FVvOs5Hf9X1gzv8UvQ@mail.gmail.com>
References: <201206170841.20222.Martin@lichtvoll.de>
	<4FDDB667.4020609@earthlink.net>
	<201206171458.58462.Martin@lichtvoll.de>
	<CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com>
	<4FDE46E4.7020009@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:64790 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757473Ab2FQVPk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Jun 2012 17:15:40 -0400
In-Reply-To: <4FDE46E4.7020009@earthlink.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: jdow <jdow@earthlink.net>
Cc: Martin Steigerwald <Martin@lichtvoll.de>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

Hi Joanne,

On Sun, Jun 17, 2012 at 11:06 PM, jdow <jdow@earthlink.net> wrote:
> I've asked Martin for a digital copy of his RDBs and what he thinks t=
he
> partition(s) should look like. I should also be told whether the disk
> is supposed to be solely Amiga OSs or not. I gather it's not.

His RDB is attached to https://bugzilla.kernel.org/show_bug.cgi?id=3D43=
521

> (And for God's sake do NOT implement the two virus storage tools with=
in
> the RDBs, the RDB encapsulated filesystems and the RDB encapsulated
> driver code. I worried about that potential since RDBs were first
> introduced. Oddly I never heard of them being used. So I kept quiet
> about it. These days those facilities could be extended to use signin=
g
> and validation certificates, I suppose.)

JFYI, I used the former to store my MultiUser File System ;-)

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
