From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [m68k] in modpost: "strlen" [iscsi_target_mod.ko] undefined!
 (and others)
Date: Mon, 2 Jan 2012 00:19:44 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201020016440.20109@herc.mirbsd.org>
References: <20111116181424.14920.7730.reportbug@ara5.mirbsd.org>
 <Pine.BSM.4.64L.1111301751500.12725@herc.mirbsd.org>
 <CAMuHMdW8t8Q7OqxJM602iLG4aSv1KMTY-fhiGS7hyy8xBReh1A@mail.gmail.com>
 <Pine.BSM.4.64L.1112181741430.856@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112181929380.856@herc.mirbsd.org>
 <Pine.BSM.4.64L.1201012310590.20109@herc.mirbsd.org>
 <20120101233931.GA25837@elie.hsd1.il.comcast.net>
 <Pine.BSM.4.64L.1201012342490.20109@herc.mirbsd.org>
 <20120102001014.GD25837@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <target-devel-owner@vger.kernel.org>
In-Reply-To: <20120102001014.GD25837@elie.hsd1.il.comcast.net>
Sender: target-devel-owner@vger.kernel.org
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: Nicholas Bellinger <nab@linux-iscsi.org>, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, target-devel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Jonathan Nieder dixit:

>Makefile instead of arch/m68k/Makefile.  If others agree, some patches
>for the x86 string functions to get the optimizations back could
>follow, leaving everyone happy.
[=E2=80=A6]
>    Even with -ffreestanding, it's still possilble to explicitely use =
a gcc
>    builtin if desired.

Just call them, like this:

tg@zigo:~/Xl/linux-2.6-3.2~rc7 $ fgrep -A 3 "define strcpy" arch/m68k/i=
nclude/asm/string.h
#define strcpy(d, s)    (__builtin_constant_p(s) &&     \
                         __builtin_strlen(s) <=3D 32 ?    \
                         __builtin_strcpy(d, s) :       \
                         __kernel_strcpy(d, s))

Of course, the parameters when to call which may differ.
(The choice about being a hosted environment is not just
about having libc-like functions available.)

bye,
//mirabilos
--=20
Solange man keine schmutzigen Tricks macht, und ich meine *wirklich*
schmutzige Tricks, wie bei einer doppelt verketteten Liste beide
Pointer XORen und in nur einem Word speichern, funktioniert Boehm ganz
hervorragend.		-- Andreas Bogk =C3=BCber boehm-gc in d.a.s.r
