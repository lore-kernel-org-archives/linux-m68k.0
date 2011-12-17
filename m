From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Sat, 17 Dec 2011 14:28:35 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324054093.2825.282.camel@deadeye>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:5662 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078Ab1LQOgI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Dec 2011 09:36:08 -0500
In-Reply-To: <1324054093.2825.282.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>

Ben Hutchings dixit:

>why other architectures get away with it.  Maybe they just don't use
>pr_*() in headers.

Maybe something like this?

#define ack_bad_irq(irq) do {					\
	pr_crit("unexpected IRQ trap at vector %02x\n",		\
	    (unsigned int)(irq));				\
} while (/* CONSTCOND */ 0)

This would defer pr_crit expansion to when the static inline
function was actually used.

Just an idea of the moment,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
