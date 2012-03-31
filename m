From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: include asm/cmpxchg.h in our m68k atomic.h
Date: Sat, 31 Mar 2012 22:01:48 +0200
Message-ID: <CAMuHMdWmq9LagZ4FydtUesq8088aWpQ29s54+4srEW5_jJy8vQ@mail.gmail.com>
References: <1333086729-14263-1-git-send-email-gerg@uclinux.org>
	<31523.1333222099@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <31523.1333222099@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: gerg@uclinux.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sat, Mar 31, 2012 at 21:28, David Howells <dhowells@redhat.com> wrot=
e:
> <gerg@uclinux.org> wrote:
>
>> From: Greg Ungerer <gerg@uclinux.org>
>>
>> After commit 9ffc93f203c18a70623f21950f1dd473c9ec48cd ("Remove all
>>
>> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0init/main.o
>> In file included from include/linux/mm.h:15:0,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/linux/ring_buffer.h:5,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/linux/ftrace_event.h:4,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/trace/syscall.h:6,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/linux/syscalls.h:78,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nit/main.c:16:
>> include/linux/debug_locks.h: In function =E2=80=98__debug_locks_off=E2=
=80=99:
>> include/linux/debug_locks.h:16:2: error: implicit declaration of fun=
ction =E2=80=98xchg=E2=80=99
>>
>> There is no indirect inclusions of the new asm/cmpxchg.h for m68k he=
re.
>> Looking at most other architectures they include asm/cmpxchg.h in th=
eir
>> asm/atomic.h. M68k currently does not do this. Including this in ato=
mic.h
>> fixes all m68k build problems.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>
> Acked-by: David Howells <dhowells@redhat.com>

Thanks! I hope to create for-3.4 and for-3.5 branches tomorrow.

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
