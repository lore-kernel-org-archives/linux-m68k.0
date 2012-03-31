From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] m68k: include asm/cmpxchg.h in our m68k atomic.h
Date: Sat, 31 Mar 2012 20:28:19 +0100
Message-ID: <31523.1333222099@redhat.com>
References: <1333086729-14263-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15291 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752249Ab2CaT2b convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 15:28:31 -0400
In-Reply-To: <1333086729-14263-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@uclinux.org
Cc: dhowells@redhat.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org

<gerg@uclinux.org> wrote:

> From: Greg Ungerer <gerg@uclinux.org>
>=20
> After commit 9ffc93f203c18a70623f21950f1dd473c9ec48cd ("Remove all
>=20
>   CC      init/main.o
> In file included from include/linux/mm.h:15:0,
>                  from include/linux/ring_buffer.h:5,
>                  from include/linux/ftrace_event.h:4,
>                  from include/trace/syscall.h:6,
>                  from include/linux/syscalls.h:78,
>                  from init/main.c:16:
> include/linux/debug_locks.h: In function =E2=80=98__debug_locks_off=E2=
=80=99:
> include/linux/debug_locks.h:16:2: error: implicit declaration of func=
tion =E2=80=98xchg=E2=80=99
>=20
> There is no indirect inclusions of the new asm/cmpxchg.h for m68k her=
e.
> Looking at most other architectures they include asm/cmpxchg.h in the=
ir
> asm/atomic.h. M68k currently does not do this. Including this in atom=
ic.h
> fixes all m68k build problems.
>=20
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: David Howells <dhowells@redhat.com>
