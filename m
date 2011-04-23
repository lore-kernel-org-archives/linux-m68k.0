From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel v2.6.38
Date: Sat, 23 Apr 2011 18:13:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:2712 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607Ab1DWSPg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 14:15:36 -0400
In-Reply-To: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>  1. The critical bugfixes will go in via v2.6.38-stable anyway,

OK.

>  2. The ARAnyM/NatFeat support will be in v2.6.39, which may be a
>sufficiently convincing argument for the Debian Kernel Team to accept
>it in Debian's v2.6.38,

Thanks, that=E2=80=99s great! (Having no ethernet is a bit limitating=E2=
=80=A6)
Please don=E2=80=99t forget to update the defconfigs (there are two com=
mits
to that effect in the queue, but that must of course be split matching
the features actually submitted=E2=80=A6).

>  3. If there's anything left that you really need, please tell us, so
>"we" can get it in a good shape for v2.6.40.

OK. While I don=E2=80=99t strictly need it, I can think of these:
=E2=80=A2 Reclaim chip RAM on Amiga
=E2=80=A2 Reserve ST RAM early

No idea about the required status of the other patches, e.g. Mac. Finn?


I=E2=80=99m Bcc=E2=80=99ing the Debian Kernel person I was talking to, =
so we may
get an agreement. I=E2=80=99ll revisit your gitweb later then, to see
which patches you actually schedule for Linus, and try to get
them into Debian.

bye,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
