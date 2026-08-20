Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E1367B9F
	for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238634; cv=none; b=ie5AD0xrOge0v2YWC1++ADZ0TqDhRdH8zn+EkAz5o2XMkA52EaN4+I6hq++70xiG3sGjOKD9j7PWwehjq66OjdYt2ApN3jvjVNi08IlVzjkZD4i6nnRtLnSEwMdThGezQ9SKw0y1TI5TVQNCDJD9kRe+3Q1Z9IxVYOYMvkMyl9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238634; c=relaxed/simple;
	bh=0xGzvEFAKexIpr3Jx5ebi+/8luqdIQ61Je5mM7EfCko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4bz7gpeDa7vAAmecsELml9MPFbV/zMLnLp1xXW7Ynbgs0z30tyXUX94vFbdsONsg4dJX8/mnXptd49CJ1p46EtHX2pi65k1oDabyEZx4uFg60u1rDbpjFaNXbrODjPQHOadmBPDcefyA/AqVrj6gYgW3px+0QcO30fYiq7gH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so806096241.3
        for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 08:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238631; x=1787843431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uyan5Na1nldJOKdYAmcF66jzIgYcyWvTRUudUs86HI=;
        b=h1bwyFRFky91fhqX7XgpRt9Qm+JMOR97y605EFnXv0RjEzAPzyx35u5nMr/lWxjJEa
         RGK5RK4TeqswtC+jzKQ0+Fo0KTgEEraBYlKX+u8zRe8AT+FxBPzAa3JxLNPKWUvsUkUi
         eAXSm1cZO5UuEVa/g1NRRONU+Y96YE1CcEr5JfBRCGLu0/2Miy55/6yNBrk40fRlJckM
         vPvuHf15BqN+b0goaNvs+bv0qQ5vnSdC9xWztjiWSHpyC4HimQpvgg30j/OhCo8p3IW2
         kTDWU0EFfXqVGrTpF8rmmh99jn6QEjakndMj35yIaJTmtv17oOdJWlpD6vXtzo6qrnui
         KpGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+9z9oKSckWd04sUdR9TRIaUBv1Ifu/P781DM0BHh7VJ/En9mttmchqiGB9EQZ2+JNdy3G3KPD8OTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYsqQHBHegAVummwBEGczZ/GuVAFfMld5WT8Bx852uVmD0MZm
	G/WfpfL5gAryDoGAPsL0qnSkFTq/bPaqj5mttDqZT9HcdljTOpzIwQfm3iHoxJxk
X-Gm-Gg: AR+sD12gNfB/YRhgj4tWnQKrTi8Dc5P0bNNETP7Dy3ufrA8KJ/LzO6SZUpB47c3jvCP
	BPFEuBgEvLeCHErFK4+T8h33l4bO00TcRGPo8dR15Y8IN/vbV8cDDXjAe8mUgRfvLPvUCFIyaEg
	v1NGHxkqjyVdcxbcZY6MkUEQVs6i7Fq1riYlJPAmvLBBXxpFxumySpvEMEM36Ta/7FmbSKUQPBN
	JmXlKpxWlF6ptdlA3u/6zAIJ/QFtcbwoh8Xc8DlkBemvPkM41q/VzWhMUebArl6HeQ70ZU0iWXq
	gYhj6j+zPoeVtzakaUv8zihnpBM8nqjAvdfYo/Ga5fs3/8T25YtXnBwc0ib04w0Ptqv7UKFc53S
	Ez7O+8pIeCAHUTwWAnH9X2Qd89OtgnCJrO+SX5BbNtnlBm8PJ/f4o9/1XHnJNrj4QnHtE2QX/g1
	h9wxj/ENKjKHhektwMpGykGTh3Wd2j5PdhY16LZB4JMBOrTBaj1Qwn17S/M1zGh+raHlc3Xqhhy
	dHGxc6WU4qV8Md0iksSfydTZQ==
X-Received: by 2002:a05:6102:4403:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-777f8b836a0mr4330304137.5.1787238631497;
        Thu, 20 Aug 2026 08:10:31 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e76040fsm5986681241.3.2026.08.20.08.10.28
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 08:10:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-777ae5e5caeso862607137.2
        for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 08:10:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEmv0JQhU0z1HpBXBiPQwFphMCx7AWv5Pm08KYFGEyNDIe025F2LszUDiPv+upNtdFSP6oOakpDK89@vger.kernel.org
X-Received: by 2002:a05:6102:3592:b0:778:71e5:45d3 with SMTP id
 ada2fe7eead31-77871e55076mr3420713137.9.1787238628474; Thu, 20 Aug 2026
 08:10:28 -0700 (PDT)
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
 <CAMuHMdWdHVMdcAPgsgoRshY4nrQnnMHp9BCpo7SHnik37oySrg@mail.gmail.com>
In-Reply-To: <CAMuHMdWdHVMdcAPgsgoRshY4nrQnnMHp9BCpo7SHnik37oySrg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 17:10:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWQF+U1S5+nz5U4AFBJ3Uff2kykqyL_MF0vPA=CAKMsw@mail.gmail.com>
X-Gm-Features: AcwNN1UwMf8mfpiHRv-BpI4-gRH2SXcU0Aru1wrLDpVsQcDeGlxpFBcTSY6E8l0
Message-ID: <CAMuHMdVWQF+U1S5+nz5U4AFBJ3Uff2kykqyL_MF0vPA=CAKMsw@mail.gmail.com>
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

On Thu, 2 Jul 2026 at 14:43, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
> On Mon, 2 Feb 2026 at 11:53, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > On Wed, 7 Jan 2026 at 09:20, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jan 6, 2026, at 20:31, Geert Uytterhoeven wrote:
> > > > On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> > > >> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> > > >> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> > > >> The diffstat is
> > > >>
> > > >>  407 files changed, 2433 insertions(+), 754 deletions(-)
> > > >>
> > > >> and I think this touches around 1500 structures, though
> > > >> most files only have a single one.
> > > >
> > > > Thanks, this seems to work fine for atari_defconfig, and generates
> > > > the exact same code as before.
>
> I kept on updating this during the last few months (I guess/hope you
> did the same?)

New one: struct mali_c55_params_ccm: Add __u16 :16;

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
