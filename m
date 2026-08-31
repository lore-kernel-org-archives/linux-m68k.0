Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D43B0AFA
	for <linux-m68k@vger.kernel.org>; Mon, 31 Aug 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168356; cv=none; b=E6Fsu583d1w/g+dZrxdEC98MYs2qgG5+2wbQK+mMh69HajIENaDLQlsUNLVUgSTqLCJ9i8tkP8m/vupF4Pnpx4wMsr8Y6TLbSYW3JvvbvzsvWud/ZZk+LbEoTZg4PWUtwfLA7RXwNSjGCNOZLeiKFyks98nYg91/QYu0rUxssto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168356; c=relaxed/simple;
	bh=GBr5UvSSbd+7QRO8XTqfbKWaQtCTGsCA4r4fX5eD/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANdBxLK+HsfEiqS+/crfYWjBI/2LelAGWKESBzqrCUzAcXDibX4W8uIIpUK4hieBQ0O+UgF1wbbR0AozwiMZWlJAIMCiu2i5hEccHSHrZurjAUbJYJ1icb4y0T780RN2xbfvixRACC49Wy/rdGoV3WTonPvb2lidXJQhz3eoc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-782df51b4c1so2359526137.3
        for <linux-m68k@vger.kernel.org>; Mon, 31 Aug 2026 02:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168354; x=1788773154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZSvABNTdzNwMDptyLiLW6VvCEUX/JqX4i7my7s+Lpg=;
        b=dyGr4uWjqsobdtqikptCW2giNJ1OHN3ZGYPlB40SOsMqD4S/oaS0sLoBxuKq5lHhcO
         gdPaN+TyV8U5UFO3VzcNXoi1fUfwu84JBdgP43D3nRU32RzDq3aT5gCoYLx3V3wwxhMx
         8EBoSM3q+ppqI2Kenv4rOaBy+pVDhgGKT43f/oc/yFhZs9Ry4y0e2bV3nIx5Sa1sARBb
         5UkwAQ5pXCzIo+D6zJLxCuddjzPOZ9kPSFQzCBIw1isgpAYUDfkMTvVTB1HtfnUbKc2u
         xgxiEugsLgmKss1gbzaWzJPLckDBDz/t+xBAwkMlAgw9iz1bTtdPpZTEAUL+EoX355tN
         JRlw==
X-Forwarded-Encrypted: i=1; AHgh+RrEzMhj8eK7tQTXv1cidUrIvlVCp6r5fsmIUpMGGNQI5sWJhyhR7Gc3khGqtIcOXURKAORC+4fy0fWF@vger.kernel.org
X-Gm-Message-State: AFuF++kxy4L0VdhzNvLofwfHN7dsQ+PpUJat9zmMTanV+orcqYGN/FHD
	4jIhjh/qxEapzxkexSJ7QzRUiIo3xoGhD9UfMMGDQXLYMR8h/YSW/zXwvYKAoINi
X-Gm-Gg: AR+sD108kevREkOX6+Kb9aDSpp26oixXY+XmvT3kVczJ70y8XGmaQ3BVGdWvjMBXS//
	SysoeDFZ87lE6f67NRd2jeduOCoyciD8fOJgn/Tn3YiDz2QdzrJE+rmp48618BIVyP2sSDwMeMY
	t7lDVcrEEcawL4pBuA4qFaoq+DeYfXFcqvQDoWCKjuDy9ZlFdN7qMkRRFhaU/IrNA+y0KiG1v/v
	xwjznqzv9/27AekG/hDrlWrh6INCYvSzrSmjhy0txSyu+CSdYwxdpuksFUu7v4jR757qNHusuTu
	dqIYF0szR58FUDi0Z5E5WFwU6OsYG1QX1ey8jH8ROKRBAc+HykldmllUYSfN2NPkAft1OvL+rky
	tXg/hbHddcqNLnaTYGY5RkOg53Rtxa3i7YgcttZJ8hbNrRusRpw/YI1Cbsa6XJOZEyynjLGqI9+
	g0QNcaIrM0xdYw1wTpsliMFx5Zr/6Mht6VYL3N3D1YN1ALJ+gHoHpFaQEqt/M9hEIZChXu52Q/E
	QXUWuWJo9aCJDMnuIt9S94IYJryRaWthfno
X-Received: by 2002:a05:6102:374d:b0:778:4fe0:8297 with SMTP id ada2fe7eead31-7859956f84dmr9352363137.11.1788168353602;
        Mon, 31 Aug 2026 02:25:53 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f5a2ce07sm6209233137.6.2026.08.31.02.25.52
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:25:52 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-746d77537f8so1942339137.0
        for <linux-m68k@vger.kernel.org>; Mon, 31 Aug 2026 02:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEbDZyEeJL9Atk3JsLhzPOdR1Ofud7M5OWASVF3qYboxLox6ewTzLlE0r6gWAgWZ9B9vbVFfYBRc1v@vger.kernel.org
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9596699137.1.1788168351919; Mon, 31 Aug 2026
 02:25:51 -0700 (PDT)
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
 <CAMuHMdWdHVMdcAPgsgoRshY4nrQnnMHp9BCpo7SHnik37oySrg@mail.gmail.com> <CAMuHMdVWQF+U1S5+nz5U4AFBJ3Uff2kykqyL_MF0vPA=CAKMsw@mail.gmail.com>
In-Reply-To: <CAMuHMdVWQF+U1S5+nz5U4AFBJ3Uff2kykqyL_MF0vPA=CAKMsw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 11:25:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMOqaXkS0kgc7W6SnnynkK0t-77p=6M6jNEFrCHPjJOA@mail.gmail.com>
X-Gm-Features: AcwNN1VIXDx_m-YVhlHon4wlm0JcaEr6-nOlb8S2hNFpbB3u81CVmiFSeseNBjA
Message-ID: <CAMuHMdUMOqaXkS0kgc7W6SnnynkK0t-77p=6M6jNEFrCHPjJOA@mail.gmail.com>
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

On Thu, 20 Aug 2026 at 17:10, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Thu, 2 Jul 2026 at 14:43, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > On Mon, 2 Feb 2026 at 11:53, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > > On Wed, 7 Jan 2026 at 09:20, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Tue, Jan 6, 2026, at 20:31, Geert Uytterhoeven wrote:
> > > > > On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> > > > >> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> > > > >> The diffstat is
> > > > >>
> > > > >>  407 files changed, 2433 insertions(+), 754 deletions(-)
> > > > >>
> > > > >> and I think this touches around 1500 structures, though
> > > > >> most files only have a single one.
> > > > >
> > > > > Thanks, this seems to work fine for atari_defconfig, and generate=
s
> > > > > the exact same code as before.
> >
> > I kept on updating this during the last few months (I guess/hope you
> > did the same?)
>
> New one: struct mali_c55_params_ccm: Add __u16 :16;

struct allocinfo_counter: Add __u8 :8; __u16 :16; __u32 :32;

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
