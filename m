From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 07/18] m68k: remove big kernel lock
Date: Sat, 16 Oct 2010 19:35:26 +0200
Message-ID: <AANLkTi=sRZggvUoKqZsv0PV6e7D+3_5Wq=54fn_93QGY@mail.gmail.com>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
	<1284492909-7147-8-git-send-email-arnd@arndb.de>
	<m21v8mkhg7.fsf@igel.home>
	<201009221304.45353.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:47193 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072Ab0JPRf2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 16 Oct 2010 13:35:28 -0400
Received: by fxm4 with SMTP id 4so1223681fxm.19
        for <linux-m68k@vger.kernel.org>; Sat, 16 Oct 2010 10:35:27 -0700 (PDT)
In-Reply-To: <201009221304.45353.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Wed, Sep 22, 2010 at 13:04, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 21 September 2010, Andreas Schwab wrote:
>>
>> Arnd Bergmann <arnd@arndb.de> writes:
>>
>> > The cache flush code only locks against itself, so there
>> > is no excuse to use the BKL here. This replaces it with
>> > a local mutex in order to maintain serialization of flushes.
>>
>> I don't think this needs a lock at all.
>
> Quite likely, I just took the most conservative approach.
> If you want to queue a patch to drop the BKL from m68k, I'll
> happily drop this one from my series.

I'm dropping the locking completely. Patch will follow.

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
