From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [m68k] in modpost: "strlen" [iscsi_target_mod.ko] undefined!
 (and others)
Date: Sun, 1 Jan 2012 18:10:14 -0600
Message-ID: <20120102001014.GD25837@elie.hsd1.il.comcast.net>
References: <20111116181424.14920.7730.reportbug@ara5.mirbsd.org>
 <Pine.BSM.4.64L.1111301751500.12725@herc.mirbsd.org>
 <CAMuHMdW8t8Q7OqxJM602iLG4aSv1KMTY-fhiGS7hyy8xBReh1A@mail.gmail.com>
 <Pine.BSM.4.64L.1112181741430.856@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112181929380.856@herc.mirbsd.org>
 <Pine.BSM.4.64L.1201012310590.20109@herc.mirbsd.org>
 <20120101233931.GA25837@elie.hsd1.il.comcast.net>
 <Pine.BSM.4.64L.1201012342490.20109@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <target-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1201012342490.20109@herc.mirbsd.org>
Sender: target-devel-owner@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Nicholas Bellinger <nab@linux-iscsi.org>, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, target-devel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Thorsten Glaser wrote:

> I=E2=80=99d rather know why upstream doesn=E2=80=99t use -ffreestandi=
ng on
> _all_ architectures. A kernel is _not_ a hosted environment,
> and GCC is right to bring in problems like this.

It's to make optimizations that use the builtin functions (e.g.,
memcpy) work with less fuss.  If the kernel implements all the
relevant library functions, then it can be considered hosted as far as
GCC cares.

[...]
>                                (Nobody prevents GCC from using
> a memcpy builtin that uses, say, SSE instructions

Doesn't -mno-sse take care of that?

However, if you (this is the general "you", not just Thorsten) find
the following reasoning[1] compelling, feel free to propose a patch to
Makefile instead of arch/m68k/Makefile.  If others agree, some patches
for the x86 string functions to get the optimizations back could
follow, leaving everyone happy.

Ciao,
Jonathan

[1]
commit d6326c18
Author: Adrian Bunk <bunk@stusta.de>
Date:   Tue Jan 4 05:29:33 2005 -0800

    [PATCH] compile with -ffreestanding

    For the kernel, it would be logical to use -ffreestanding.  The ker=
nel is
    not a hosted environment with a standard C library.

    The gcc option -ffreestanding is supported by both gcc 2.95 and 3.4=
, which
    covers the whole range of currently supported compilers.

    Regarding changes caused by this patch:

    Andi Kleen reported:
      Newer gcc rewrites sprintf(buf,"%s",str) to strcpy(buf,str) trans=
parently.

    This is only true with unit-at-a-time (disabled on i386 but enabled=
 on
    x86_64).  The Linux kernel doesn't offer a standard C library, and =
such
    transparent replacements of kernel functions with builtins are quit=
e
    fragile.

    Even with -ffreestanding, it's still possilble to explicitely use a=
 gcc
    builtin if desired.
