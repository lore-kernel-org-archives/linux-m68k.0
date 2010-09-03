From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Fwd: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
 addresses in the arch directory.
Date: Fri, 3 Sep 2010 10:42:19 +0200
Message-ID: <AANLkTik3+3dWP-=4mnOrPDSBCKoyy=1Rs8Hq-htDC-Lw@mail.gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
	<1283461746-7905-6-git-send-email-justinmattock@gmail.com>
	<AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com>
	<4C80AE79.2040805@gmail.com>
	<alpine.OSX.2.00.1009031823590.344@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:48602 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347Ab0ICImT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 04:42:19 -0400
Received: by iwn5 with SMTP id 5so1356273iwn.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2010 01:42:19 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1009031823590.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Justin P. Mattock" <justinmattock@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Sep 3, 2010 at 10:32, Finn Thain <fthain@telegraphics.com.au> w=
rote:
> On Fri, 3 Sep 2010, Justin P. Mattock wrote:
>> On 09/03/2010 12:52 AM, Geert Uytterhoeven wrote:
>> > linux-alpha was the wrong list?
>>
>> it is... I became overwhelmed with who to send these too i.e. having=
 too
>> many Cc's was in question, so I used getmaintainer.pl on the first p=
atch
>> to give me some direction on who/what/where to send these too. first=
 was
>> --to trivial@ then from there I became hesitant on what todo.
>
> linux-2.6.35$ ./scripts/get_maintainer.pl -f arch/m68k/mac
> ./scripts/get_maintainer.pl: No supported VCS found. =C2=A0Add --nogi=
t to options?
> Using a git repository produces better results.
> Try Linus Torvalds' latest git repository using:
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x-2.6.git
> Joshua Thompson <funaho@jurai.org>
> Geert Uytterhoeven <geert@linux-m68k.org>
> Roman Zippel <zippel@linux-m68k.org>
> linux-m68k@lists.linux-m68k.org
> linux-kernel@vger.kernel.org
>
> Indeed, the MAINTAINERS file says that the list for arch/m68k/mac/ is
> linux-m68k@lists.linux-m68k.org. Is this alias still working? Perhaps=
 it
> should be changed to linux-m68k@vger.kernel.org?

The alias should work:

lists.linux-m68k.org.   86400   IN      CNAME   vger.kernel.org.

> I'll send another email to "funaho@jurai.org" and see what happens...=
 but
> I think this address should be removed in favour of the the mailing l=
ist
> address because it never worked for me before.

Don't know about Joshua. It's been a while I saw patches from him.

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
