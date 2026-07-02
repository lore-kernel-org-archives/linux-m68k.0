Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBFC44BCA5
	for <linux-m68k@vger.kernel.org>; Thu,  2 Jul 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996199; cv=none; b=N0CYR41JyQQLtDe1QeWhwUuxmecsuDMfctugxTZbed+FCZu0eP5FTUvJmlNAX9ptnPA/M1h5KF+9TB1NMIXG7C4BjxOodpZIdGuycayFMQooL787EsqdAsHaIVP2vbl8IU1XpuQC5x63cWRmBRWo3cG7w1gNQofZ0qOo42u7x5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996199; c=relaxed/simple;
	bh=WIEwhCoUdw+YoRbJ079BDNN5GEjXguXzSVUq3koNf54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+Zz+xlG1iWdCbhFXcfrpjPvHZ+ckOdLdn6IQncgtXiJ2PC/aN/YRheMZOpuhPuiCElsUs/9e1Dh0gifzGbJHJSjziViXOHhkY8lCv/ZQhrqnN6XGRaw87MG7OCT/z3JENy8TjqdK0zObZqsV3IRAnObnaNS0/gEwM0n8BFNqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7387ac7d28cso542250137.1
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jul 2026 05:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996197; x=1783600997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiBunQqIoMbyQFsKBQavFU4WGhX8v9MjC3gFPGQ18jQ=;
        b=o7ylqlxjAGf+6ILrvpOoh52zaZtGyP6Ert/6nJ993FouvMeCODpjiLfGwUOO4NHF3F
         hIKtq4PcmhKRu5NCrE61fixPjWrtd/g6YCML6y3OkRwK4u0c+APXzUI5P2zlnQ/Y4hfU
         2avckUybWSXQxvKcv6L7mGyXpdjFmzF0eZi3pBGUOs107jlKtlJkek3XeCjlEOljomXI
         pIRiAg6rVC0uXqHgRU4+34j7JUSQGhN1f7gXONaNt1+Sm+cPDvE7azaKun2F3msUreKd
         G/SrxgJ2X3466TP0W/zS2AM2caFlw9gv79czexdRJmHVE/4OxcV9HyhlfGDEJk61iGYv
         U/fg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+eatbI4mxxpGCFqsI3U5CcfrZHCuh8MfAcpzDSLul8FO5OSuACZZyqygjo9g3eQ24g9BAb/oRNC/U@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqQmZR3R0SODGxXi61N4NBT/Zzkyd15WekoavZN2WJqDKZbAV
	mGvmiNQImmvS5tcjh9wZzj6j6bloAwoot2MDmDOQNc8hlSPZIRS7T97XEECjcuAI
X-Gm-Gg: AfdE7cnNv51fj5SPOc+c7vsiyePbrkfcPvXHl/kOhwndnbqY/NIWsdvuoQi7JOkN0G4
	Tw27YeAubwYUhxQ6tpGuoFdaU6pyky2NVo59ka+MaDZVfA82lPFPVHQyt5aMizq41qLk5gRGYMY
	q/GZbm5bzSqhbeo5fN9AiZWr2W0I3Ksximr3C+3xp3sLKztx5u+8448h2Sh+J4cQIwaWs90FQwj
	3jSH91IgSYHiwRr898WazdDkFOhHtArWolDkIvD08ijSgdxSWyKy6K+GAt+xlOPIDtmKrN7Loh0
	d0mCx2HMsVzv8QijW7gcGjZsizjwqaA1Wu0mc+tJZOdQVZWmaVPwtv3Tiag3kGEqd309aPYfGG4
	2WGGVyQD58KGw6DU89uBOvasEHSK9WwkJ7jIaYonCCZ1IYz9jbXBljTg9Ds9up4LHwfXV/iDQ5H
	zQwx2Od44pK5D/VGL3d1O3dHd/NuHd5sya6DVPYVgs7cFkksr8es2lPu2z76Sr
X-Received: by 2002:a05:6102:30c7:20b0:73e:c6a0:328 with SMTP id ada2fe7eead31-73ec6a01642mr308120137.19.1782996196712;
        Thu, 02 Jul 2026 05:43:16 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e19f3af52sm1186202137.3.2026.07.02.05.43.15
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:43:16 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so591776241.1
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jul 2026 05:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpiI3DBKDVJuYMXA5MgEz1OtEsK+w7Ts12kpTszuJFr8a25MgLiK6TZKHo9Ap2qownUZ7o/kQkzwoNi@vger.kernel.org
X-Received: by 2002:a05:6102:3e09:b0:720:7e04:b306 with SMTP id
 ada2fe7eead31-73dbd6070cemr1899543137.5.1782996195582; Thu, 02 Jul 2026
 05:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no> <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com> <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
 <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com> <CAMuHMdUjOw2VJTNM97+8iiG6uB5_2XuksSxF=1AMWNR4WsyD0A@mail.gmail.com>
In-Reply-To: <CAMuHMdUjOw2VJTNM97+8iiG6uB5_2XuksSxF=1AMWNR4WsyD0A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 14:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdHVMdcAPgsgoRshY4nrQnnMHp9BCpo7SHnik37oySrg@mail.gmail.com>
X-Gm-Features: AVVi8CeqBpfPU0inN5tos32weCTn-CJ8vyA7rvZz0ZF3LuQZNTmCveFJmGD5Hw0
Message-ID: <CAMuHMdWdHVMdcAPgsgoRshY4nrQnnMHp9BCpo7SHnik37oySrg@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: Arnd Bergmann <arnd@arndb.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, 2 Feb 2026 at 11:53, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
> On Wed, 7 Jan 2026 at 09:20, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Jan 6, 2026, at 20:31, Geert Uytterhoeven wrote:
> > > On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> > >> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> > >> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> > >> The diffstat is
> > >>
> > >>  407 files changed, 2433 insertions(+), 754 deletions(-)
> > >>
> > >> and I think this touches around 1500 structures, though
> > >> most files only have a single one.
> > >
> > > Thanks, this seems to work fine for atari_defconfig, and generates
> > > the exact same code as before.

I kept on updating this during the last few months (I guess/hope you
did the same?)

> >
> > Ok, good. The more interesting bit then is what happens when
> > you actually turn on -malign-int for the kernel itself. There
>
> It fails to build due to wrong and missing annotations in union __sifield=
s:
>
> arch/m68k/kernel/signal.c:621:9: note: in expansion of macro =E2=80=98BUI=
LD_BUG_ON=E2=80=99
>   621 |         BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);
>
> which is probably the same issue Kolla was seeing.

The following are failing with -malign-int:

        BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);
        BUILD_BUG_ON(offsetof(siginfo_t, si_upper) !=3D 0x16);
        BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) !=3D 0x12);

All of these are due to

    #define __ADDR_BND_PKEY_PAD  (__alignof__(void *) < sizeof(short) ? \
                                  sizeof(short) : __alignof__(void *))

(which is no longer correct for m68k and -malign-int), and incorrect/missin=
g
annotations for the three fields succeeding the use of the former.

I couldn't fix it using the __uapi_* infrastructure you provided, but
the following (gmail-whitespace-damaged) patch fixes the BUILD_BUG_ON()s:

--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@ -71,8 +71,12 @@ union __sifields {
        struct {
                void __user *_addr; /* faulting insn/memory ref. */

+#ifdef __m68k__
+#define __ADDR_BND_PKEY_PAD  sizeof(short)
+#else
 #define __ADDR_BND_PKEY_PAD  (__alignof__(void *) < sizeof(short) ? \
                              sizeof(short) : __alignof__(void *))
+#endif
                union {
                        /* used on alpha and sparc */
                        int _trapno;    /* TRAP # which caused the signal *=
/
@@ -84,13 +88,13 @@ union __sifields {
                        /* used when si_code=3DSEGV_BNDERR */
                        struct {
                                char _dummy_bnd[__ADDR_BND_PKEY_PAD];
-                               void __user *_lower;
-                               void __user *_upper;
+                               void __user *_lower __attribute__
((packed, aligned(2)));
+                               void __user *_upper __attribute__
((packed, aligned(2)));
                        } _addr_bnd;
                        /* used when si_code=3DSEGV_PKUERR */
                        struct {
                                char _dummy_pkey[__ADDR_BND_PKEY_PAD];
-                               __u32 _pkey;
+                               __u32 _pkey __attribute__ ((packed,
aligned(2)));
                        } _addr_pkey;
                        /* used when si_code=3DTRAP_PERF */
                        struct {

Unfortunately the resulting kernel hangs (on ARAnyM) after:

    Console: colour dummy device 80x25
    printk: legacy console [tty0] enabled

Back to real work...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
