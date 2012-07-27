From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: ARAnyM VMs with Debian hanging at 100% CPU usage
Date: Fri, 27 Jul 2012 17:23:11 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1207271716480.13882@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1207251948400.18420@herc.mirbsd.org>
 <Pine.BSM.4.64L.1207271525530.13882@herc.mirbsd.org> <m2zk6lnqo0.fsf@igel.home>
 <Pine.BSM.4.64L.1207271604380.13882@herc.mirbsd.org> <m2vch9nnwu.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <m2vch9nnwu.fsf@igel.home>
Resent-Message-ID: <IXq4MYViHGK.A.wKD.g6sEQB@bendel>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org, Petr Stehlik <pstehlik@sophics.cz>
List-Id: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>Thorsten Glaser <tg@mirbsd.de> writes:
>
>> GCC happens to generate these if you use the atomic builtins
>> even in 4.6 already.
>
>I don't.

You don=E2=80=99t say=E2=80=A6 oh well.

GCC 4.7 uses the cas instruction, against the recommendations
of the Linux kernel developers. What=E2=80=99s to say? Let=E2=80=99s force =
it
to use the syscall then.

root@aranym:~ # gcc-4.7 -O2 -g3 -Wall -o t47 t.c -m68000
root@aranym:~ # gdb ./t47
[=E2=80=A6]
Dump of assembler code for function main:
   0x80000354 <+0>:     linkw %fp,#0
   0x80000358 <+4>:     movel %a3,%sp@-
   0x8000035a <+6>:     movel %a2,%sp@-
   0x8000035c <+8>:     movel 0x80003388 <ctr>,%d0
   0x80000362 <+14>:    movel %d0,%sp@-
   0x80000364 <+16>:    pea 0x80001248
   0x8000036a <+22>:    lea 0x80000304 <printf@plt>,%a3
   0x80000370 <+28>:    jsr %a3@
   0x80000372 <+30>:    clrl %sp@-
   0x80000374 <+32>:    lea 0x80000318 <fflush@plt>,%a2
   0x8000037a <+38>:    jsr %a2@
=3D> 0x8000037c <+40>:    pea 0x1
   0x80000380 <+44>:    pea 0x80003388 <ctr>
   0x80000386 <+50>:    jsr 0x80000a06 <__sync_add_and_fetch_4>
   0x8000038c <+56>:    addql #8,%sp
   0x8000038e <+58>:    movel 0x80003388 <ctr>,%d0
   0x80000394 <+64>:    movel %d0,%sp@-
   0x80000396 <+66>:    pea 0x80001253
   0x8000039c <+72>:    jsr %a3@
   0x8000039e <+74>:    clrl %sp@-
   0x800003a0 <+76>:    jsr %a2@
   0x800003a2 <+78>:    moveq #0,%d0
[=E2=80=A6]
(gdb) si
0x80000a06 in __sync_add_and_fetch_4 ()
(gdb) disas
Dump of assembler code for function __sync_add_and_fetch_4:
=3D> 0x80000a06 <+0>:     linkw %fp,#0
   0x80000a0a <+4>:     moveml %d2-%d3/%a2,%sp@-
   0x80000a0e <+8>:     moveal %fp@(8),%a2
   0x80000a12 <+12>:    movel %a2@,%d2
   0x80000a14 <+14>:    movel %fp@(12),%d3
   0x80000a18 <+18>:    addl %d2,%d3
   0x80000a1a <+20>:    moveal %a2,%a0
   0x80000a1c <+22>:    movel %d3,%d1
   0x80000a1e <+24>:    movel #335,%d0
   0x80000a24 <+30>:    trap #0
   0x80000a26 <+32>:    cmpl %d2,%d0
   0x80000a28 <+34>:    bnes 0x80000a34 <__sync_add_and_fetch_4+46>
   0x80000a2a <+36>:    movel %d3,%d0
   0x80000a2c <+38>:    moveml %sp@+,%d2-%d3/%a2
   0x80000a30 <+42>:    unlk %fp
   0x80000a32 <+44>:    rts
   0x80000a34 <+46>:    movel %d0,%d2
   0x80000a36 <+48>:    bras 0x80000a14 <__sync_add_and_fetch_4+14>
End of assembler dump.
[=E2=80=A6]
0x80000a24 in __sync_add_and_fetch_4 ()
(gdb) info r
d0             0x14f    335
d1             0x12345679       305419897
d2             0x12345678       305419896
d3             0x12345679       305419897
d4             0x1d     29
d5             0xd004eefc       -804983044
d6             0xd004edfc       -804983300
d7             0xc      12
a0             0x80003388       0x80003388
a1             0xc014b7f4       0xc014b7f4
a2             0x80003388       0x80003388
a3             0x80000304       0x80000304
a4             0x800003b0       0x800003b0
a5             0xc0148000       0xc0148000
fp             0xef8d4b60       0xef8d4b60
sp             0xef8d4b54       0xef8d4b54
ps             0x8300   [ I0 I1 T1 ]
pc             0x80000a24       0x80000a24 <__sync_add_and_fetch_4+30>
fpcontrol      0x0      0
fpstatus       0x0      0
fpiaddr        0x0      0
(gdb) si
[=E2=80=A6 aaaaaaand, freeze! ]

Okay. So there=E2=80=99s something wrong with either the way how
GCC uses the syscall, or how the syscall is implemented
in Linux, or how ARAnyM runs that (unlikely).

Additionally, GCC doesn=E2=80=99t use the syscall with -m68020,
which is default in Debian/m68k. Linux and Debian devs,
please comment on whether that should be kept or changed.

Thanks,
//mirabilos
--=20
=E2=80=9CIt is inappropriate to require that a time represented as
 seconds since the Epoch precisely represent the number of
 seconds between the referenced time and the Epoch.=E2=80=9D
=09-- IEEE Std 1003.1b-1993 (POSIX) Section B.2.2.2
