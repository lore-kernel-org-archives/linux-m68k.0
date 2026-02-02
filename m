Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10F35B143
	for <linux-m68k@vger.kernel.org>; Mon,  2 Feb 2026 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029647; cv=none; b=GQl6xW5ai3X4yjhMlNDum7G4w1m4v5s9Edj+aEG5UlMneRZNgi8K0szS8s62qMjLi4Xj9DFOXD67MHjWt0LOGhus9cObE7AdcozkPVMfZVil71NFw1b1HFVBUYwbnaGxUbThGuactGRuZX1dn8h9KIEmIUYswIb3yu0H3VSCwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029647; c=relaxed/simple;
	bh=IFZGxra1fFv1Y4JQnjnlmlFCdyNQXAFRc1+ZSwcy6/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nwe8rZ10KPv3V1KxaidwgRaAHBEfC53FwUmp2iZjFSL5jcrO0J8JasrTXIVYgnL4dAuba98cXm6tHIPJ4V8+phNhRYOQND8YnXGCtbk28j+FVEpC4L5M4wHCW6Dcu401l2F9PEbooLkjQyHfdqcCXANE9cIO3do1cjxFfETO5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-948ba5ccf54so616234241.1
        for <linux-m68k@vger.kernel.org>; Mon, 02 Feb 2026 02:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029644; x=1770634444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiZdFVEWha8fP4uybM+hgvBpBItp0iLBknM+TKJl6Qs=;
        b=v2IakchDs/eUtVIMTYSXtHdEYPWi53mk7DGESEf3yRZGZoImrPWKFlxLhYl6nKapgG
         zVDtRqfW5msl2O3wdtkRIJCrcJTSaChsV8mi0F+S3c3baUB2KmDGxieVUeviWsG/86ua
         LcvYe4HV9UJJDYbuAKiCZkKaTte/R4ns2dKD1NmVgQr5Byfh60Y2ZFGeUM/G0i3x2XgD
         5HG23kKkFb8A74yd+tbwGRX6+2TkXGzggKp9QGGfsNtr92rN2haDuFnEdxsa1DpPS6qc
         W/HnZSXS2oRN2uFbbSJl4RDIOgbr0L7BrQoj3Oq6MrH1wj/Yln17qVcr1kI5b3rzOQya
         ZG3g==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5dBCwN/EmDbP/gp6iYaBKFI4igAdKJpVEyCWKLDSLxW2ctsG9H8aEXnMrypPvrug0OzzrZ1nXRHD@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdq612CssAfRNkfQ/cmWIij0+BoXpEqDR99kWchhJed469gW4
	GqdYStQ4sUerRJa+i8kfd/LmNeXQLkpg7OKc7k8hj4eaYTHsDHLgncKEklFzvmF+
X-Gm-Gg: AZuq6aK0b7Ax6IhXBlW6DrzvmkAYovrwuogkjsqJv7DkQG1p3vRRWpwkJGEAQexK5RT
	Fgn3L44J+yWVCOmkn5DBEgmaAv79W1zcy5iOmBhC+IEJNg0eQTClSSupMpmfNbFIIEz2eOxIXQT
	XbC+nzN+uGBd7xrnWBW8DjcvphH8+UeaTV4GVbIwY0skS7RGWNOQyIzdH1TmCZrnnWcjSDN+kk5
	Sjg6dpWTlrRGZNDl0a464gYLu1kEl3jdw8JYn/aPmoKen+aJHxjRP5bSfGCAJ8ByXlX6HJ23JBO
	nV2bvT5xun4mLfCDW84FxRlAd5GRvKhMm1vK2NwknOXnJsT1Ijx4lMX5WhHYpulMZAGeVFhP1Nf
	OPfzB4cN+rDuTmdIfS2YZD9gC3DEB1sxSrnVOHKrNREA93Y2fQxFZDryq8ZeFvdODLWpXAledu6
	wlKppYC4BUHlyO5dYm6SqocPvRUcVf6mCUCNCiqw9Fe/ygHekD
X-Received: by 2002:a05:6102:c94:b0:5ef:8ae:85a5 with SMTP id ada2fe7eead31-5f8e24db749mr3533357137.16.1770029644090;
        Mon, 02 Feb 2026 02:54:04 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f734c8db75sm4348231137.4.2026.02.02.02.54.03
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:54:03 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eeff7e8bb3so3094231137.1
        for <linux-m68k@vger.kernel.org>; Mon, 02 Feb 2026 02:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLt7g6lvR0rHqEgA/0p5mmeGi9eg08pnok4Luibsaj3gl51lcyzOtJqRCyDvWqnT7YhhjRw/vvA5pV@vger.kernel.org
X-Received: by 2002:a05:6102:3913:b0:5f1:c519:9506 with SMTP id
 ada2fe7eead31-5f8e24e5ca1mr3668126137.17.1770029642894; Mon, 02 Feb 2026
 02:54:02 -0800 (PST)
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
 <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com>
In-Reply-To: <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Feb 2026 11:53:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjOw2VJTNM97+8iiG6uB5_2XuksSxF=1AMWNR4WsyD0A@mail.gmail.com>
X-Gm-Features: AZwV_QhPTCFqyheN3y3hmeDruAzpLc1CYPWJtSf9BmCuwnYkajJt3VUiHCBp8i0
Message-ID: <CAMuHMdUjOw2VJTNM97+8iiG6uB5_2XuksSxF=1AMWNR4WsyD0A@mail.gmail.com>
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

On Wed, 7 Jan 2026 at 09:20, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jan 6, 2026, at 20:31, Geert Uytterhoeven wrote:
> > On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> >> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> >> The diffstat is
> >>
> >>  407 files changed, 2433 insertions(+), 754 deletions(-)
> >>
> >> and I think this touches around 1500 structures, though
> >> most files only have a single one.
> >
> > Thanks, this seems to work fine for atari_defconfig, and generates
> > the exact same code as before.
>
> Ok, good. The more interesting bit then is what happens when
> you actually turn on -malign-int for the kernel itself. There

It fails to build due to wrong and missing annotations in union __sifields:

arch/m68k/kernel/signal.c:621:9: note: in expansion of macro =E2=80=98BUILD=
_BUG_ON=E2=80=99
  621 |         BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);

which is probably the same issue Kolla was seeing.

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
