Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E98313CFA8
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jul 2024 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720984289; cv=none; b=oGQ2HC7w//gkCdZZhpquJHvuwOHYqrmxTM0oEfYyTJJLiSmRIEKEOfu/a+/y7SloPXYVNL4+8tCzjFztoQPK2brMJ2cMtH6Gxm6XfQSjzNSrFgwzJVWi6qQwo6ysOmZ35gG3erR0gg1zWSxEWJJWEI0AURcKVWN5uyi6vUOHBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720984289; c=relaxed/simple;
	bh=j1K+FHZkDrmPGCmRtv9k9UB1axm98p1I0h+AuSiKzUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPORl19LVS9MrcHIEafyyEmL4NlsUqMRJhfp1aNAMrC/t9AKI6hbUAdkwXqPSAzOFazRRhGRWkJVuMC4JJuSk5qMxVQvBb9Bi5FkSt4J3uP9v7zlrWCQWfPRR4lPs4ucwlX0kQg+JC6kSS8Of2KIUQImy/tgx1u/i5KfaqHFz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPQ7VRq1; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPQ7VRq1"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 163B1CE0B7E
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jul 2024 19:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5827AC4AF0D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jul 2024 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720984282;
	bh=j1K+FHZkDrmPGCmRtv9k9UB1axm98p1I0h+AuSiKzUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PPQ7VRq1SyJdFQ/vrIS/BwD8aDEIyNzyzyKkmv/4qMm7CIVy4260GLbB7uQDrkVis
	 m7G5up3miZkaYpPthpdgKdRdjWAjReTDvRK1aKjd/8BtNEWHuAf+3AwhHLOGXrBwT+
	 QKSREO9RLxDYsIHrjZrjJ0ouu/lGAQ3LE5IQHvYGgrvYJppMinfDj1v+7mZ4iQ32q3
	 nA72XPpd7XSNgbmC12wa0KtNf/7KXQGzo3z+OD2WKZN4CxIX+YJx8s3Smq3iIk3Rhh
	 mRcQSX3HM7txL8sIZ8dyZ7Dko0DRi66wT1Xyrhb5s3EH/+utMT2uByQVjU4w1mA0QW
	 Oh+la7VoVTDoA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso47316351fa.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jul 2024 12:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVM8yN8GwJLd66IN/EYT0YF89CpyDnOYvAIVSMn1PIXBdkJGCHntMNZmLu8wvgMfB8PNq3hmLHFTLpfJdHbCcwN1/X4qnW0wIf2N6IoX1u7
X-Gm-Message-State: AOJu0YwyyZqvrAFmS/Nmdi74l12NDYogIMfBAdjbZcIcd+58f0Jssw+M
	SBaWw+FUXsNsQUiDHMf/PW1EtI5tZX0J6gwhju7sPxdEFxFq8qxLg6AhPbC30u9/2lj50J80jFz
	NwuRxHE/2d4IzqSmY3DmVJ3nfj3M=
X-Google-Smtp-Source: AGHT+IHco7JMHnTGGI6P5HuxenTXttge5tcKuT+hmuXdenuS/OHkLGnMUkXSXoFgko7rH3SUNvioLnYHIzgG21hNw84=
X-Received: by 2002:a05:6512:124d:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-52eb99d4c0fmr12914869e87.42.1720984260332; Sun, 14 Jul 2024
 12:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714085751.176357-1-xtex@envs.net> <20240714085751.176357-2-xtex@envs.net>
In-Reply-To: <20240714085751.176357-2-xtex@envs.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 04:10:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 5:58=E2=80=AFPM Zhang Bingwu <xtex@envs.net> wrote:
>
> From: Zhang Bingwu <xtexchooser@duck.com>
>
> Setting '-e' flag tells shells to exit with error exit code immediately
> after any of commands fails, and causes make(1) to regard recipes as
> failed.
>
> Before this, make will still continue to succeed even after the
> installation failed, for example, for insufficient permission or
> directory does not exist.
>
> Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>


Applied to linux-kbuild. Thanks!


--=20
Best Regards
Masahiro Yamada
