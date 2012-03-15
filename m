From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 13/35] Disintegrate asm/system.h for M68K [ver #2]
Date: Thu, 15 Mar 2012 20:18:33 +0000
Message-ID: <7100.1331842713@redhat.com>
References: <4F608A15.9030609@snapgear.com> <20120312233602.13888.27659.stgit@warthog.procyon.org.uk> <20120312233816.13888.142.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51300 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161119Ab2COUSr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Mar 2012 16:18:47 -0400
In-Reply-To: <4F608A15.9030609@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: dhowells@redhat.com, paul.gortmaker@windriver.com, hpa@zytor.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, arnd@arndb.de, linux-m68k@vger.kernel.org

Greg Ungerer <gerg@snapgear.com> wrote:

> This breaks compilation for m68k targets with:
>=20
>   CC      net/ipv4/ip_input.o
> In file included from
> /home/gerg/new-wave.320/linux-3.x/arch/m68k/include/asm/system.h:3:0,
>                  from net/ipv4/ip_input.c:116:
> /home/gerg/new-wave.320/linux-3.x/arch/m68k/include/asm/cmpxchg.h: In=
 function
> =E2=80=98__xchg=E2=80=99:
> /home/gerg/new-wave.320/linux-3.x/arch/m68k/include/asm/cmpxchg.h:33:=
3: error:
> implicit declaration of function =E2=80=98BUG=E2=80=99
>=20
> The old system.h included linux/kernel.h which includes asm/bug.h.
> Just including asm/bug.h here in cmpxchg.h is not enough to fix it.
> If you include linux/kernel.h though it compiles cleanly.

Which targets, btw?

David
