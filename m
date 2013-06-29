From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arch: m68k: include: asm: define 'VM_DATA_DEFAULT_FLAGS'
 no matter whether has 'NOMMU' or not.
Date: Sat, 29 Jun 2013 10:26:02 +0200
Message-ID: <CAMuHMdVAQJWDem0=uMnH7iVrckxPJ9cPn=8pYOusNov+wW5VeA__22714.1844960444$1372494396$gmane$org@mail.gmail.com>
References: <51C548E2.1060104@asianux.com>
	<51C54A9B.9060009@asianux.com>
	<51CE9442.2020105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51CE9442.2020105@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Chen Gang <gang.chen@asianux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

On Sat, Jun 29, 2013 at 10:01 AM, Michael Schmitz <schmitzmic@gmail.com=
> wrote:
>> The same .config file, also report the compiling error below:
>>
>> drivers/i2c/busses/i2c-ocores.c:81:2: error: implicit declaration of
>> function =E2=80=98iowrite8=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>> drivers/i2c/busses/i2c-ocores.c:86:2: error: implicit declaration of
>> function =E2=80=98iowrite16=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>> drivers/i2c/busses/i2c-ocores.c:91:2: error: implicit declaration of
>> function =E2=80=98iowrite32=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>> drivers/i2c/busses/i2c-ocores.c:96:2: error: implicit declaration of
>> function =E2=80=98ioread8=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
>> drivers/i2c/busses/i2c-ocores.c:101:2: error: implicit declaration o=
f
>> function =E2=80=98ioread16=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>> drivers/i2c/busses/i2c-ocores.c:106:2: error: implicit declaration o=
f
>> function =E2=80=98ioread32=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>>
>> Excuse me, I am not quite familiar with the related hardware and m68=
k,
>> I guess under m68k architecture, we need not this drivers, is it cor=
rect ?

Until someone synthesizes the OpenCores i2c core together with the
OpenCores 68000 core (they seem to have one), and tries to run uClinux
on it...

> That would be correct, yes. Perhaps add appropriate dependencies in
> drivers/i2c/Kconfig to allow building I2C drivers
> only on hardware that supports it?

We still want it for compile-coverage.

Now, the issue is that m68knommu doesn't implement ioread8() and
friends, so I'm adding the uClinux list.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
