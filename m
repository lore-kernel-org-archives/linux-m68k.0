From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] fix m68k support
Date: Sun, 29 Jan 2012 19:51:24 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201291950340.4290@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
 <201201290049.q0T0nKsw030673@herc.mirbsd.org> <m2sjizgcz8.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:37985 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098Ab2A2T7N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jan 2012 14:59:13 -0500
In-Reply-To: <m2sjizgcz8.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: klibc@zytor.com, linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>Thorsten Glaser <tg@mirbsd.org> writes:
>
>> +	bcs.l	1f			/* jump if _not_ error */
>
>Why .l?

Mostly copy/paste from other m68k asm code. I don=E2=80=99t know it
well enough to say, and I did the fix by mentally translating
this to i386 asm, fixing the logic bug there and translating
it back, plus peeking at eglibc=E2=80=A6 by all means, fix my bugs ;)

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
