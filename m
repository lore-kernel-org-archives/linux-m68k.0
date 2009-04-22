From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 22 Apr 2009 15:41:31 +0200
Message-ID: <10f740e80904220641n6e3aef55od3dc74e08b2c5d66@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <20090421172039.GA26858@marenka.net>
	 <10f740e80904220020o70837da9mfb74cbbfb0f917d3@mail.gmail.com>
	 <20090422125706.GC5886@marenka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:59470 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752297AbZDVNld convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Apr 2009 09:41:33 -0400
Received: by ewy24 with SMTP id 24so2104304ewy.37
        for <linux-m68k@vger.kernel.org>; Wed, 22 Apr 2009 06:41:31 -0700 (PDT)
In-Reply-To: <20090422125706.GC5886@marenka.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org, linux-m68k@vger.kernel.org

On Wed, Apr 22, 2009 at 14:57, Stephen R Marenka <stephen@marenka.net> =
wrote:
> On Wed, Apr 22, 2009 at 09:20:31AM +0200, Geert Uytterhoeven wrote:
>> On Tue, Apr 21, 2009 at 19:20, Stephen R Marenka <stephen@marenka.ne=
t> wrote:
>
>> > http://wiki.debian.org/M68k/Kernel/Patches

>> =C2=A0 - You may want to put a `sort' in the `find ../bugfix/m68k/2.=
6.29
>> -print | sed -e 's;../;+ ;' | sed -e 's;$; m68k;' >> $series`
>> =C2=A0 =C2=A0 pipeline.
>
> The patches come out numbered 0001-0090. I'm not sure what I can sort=
=2E

The numbers ;-) `find' is not guaranteed to return them in order.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
