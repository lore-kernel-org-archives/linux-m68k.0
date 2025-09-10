Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15A2472B5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490329; cv=none; b=Vpz2yAwpX0Ba72td7wy9qz3a2lMcKJMwgHyIcA489iSjn3Dn8+EQWh9ZILLX/1Hw3SXumSa0PixvSUiyQpjbuL+mSO2AibOPnFe3Qcz22lVzdwr1NhhlgvHWuX54jho8FvZ8AD3oMMawGUsbope0R7VusjO/xAhjtvHA/Lr5cv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490329; c=relaxed/simple;
	bh=9UuXzhqtep4bvja/B6ExlTlasfLtdKs112q+8BCNMdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxcbYyCOc6sI/9knz9b0JEXlkUjpop2Q7sMzXA94gsJucp6l7G2k+R85L4Pw51p1LwI2Mvx1PP1Gkp+97q9JYDuk3vpvUzydDn8z3ezhFn8NrYpld0rPwFO48n2tGoDeqQsKxP/O0TDq64vnFwJ2BaJRh7wOCs866Uat86RZ3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8a756436f44so2596264241.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490327; x=1758095127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DubuMdJZ62j7dpAJW8CXKMHknQNz0VO1TEQG3tD98cw=;
        b=NTen60xqqPVXss4E64ICBMqA2IkQ1Q1INor3Bw9h2P3EL1uW96O0Rqc3nSyka8dwXN
         sihUbpMSIcmV8wfsoDCjQETjPS8zSHcN8x081713JmT97lmUKcoUb9wumldqL2skbN2+
         p3m/j8d14tuiInel8i5jy9R+U9m08vw1C4wUZjuZ8Xuu+P8wkkF4CSDKYt8X3/r9doH1
         38EnmbmBkYk0RNfNXqFhZfGTw3rK4Xh9I0kcaQUwwbSOwu6wdnv9gedLhAc+6w8WcLU8
         kVI4rLYl1SElyKNJt2m00ZHTk/ffpwC1gTiAAsANApSK5jJagInoitOr42lSJBbpbxgw
         votg==
X-Forwarded-Encrypted: i=1; AJvYcCXEiUElkJCYxshzY0hd9WQyYVrdA91OowRO+8Q/bub6bRgPeje3CCW874ZZ/5OBPvnTLIAfdvVfvy48@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyOvZhQrdhIQOQI7PtqpjZl++pIBuXylgsQrzeMgMPnWkxYN0p4
	NzHZsuIeke6WJinCrygk6fW3pF4hN2ZYCCv768XbUQ1ZwKCikSnsvlWEpTrpj2/c
X-Gm-Gg: ASbGncsXhAmuKj97ivEMXrFIgmaf99mNultZzGTK1G2gj9zsLaH6Q13TYt1JCv7m+pA
	qz9C3MFSN9audPG1GXIk8uOkRLwsA9Ikw9CmOypBm7C9fcJmPUj+mmmoht1eRGIs/7/1ECbmZqj
	p3TWdRw63JnOgvTBryVP8MOca4VUm68lL84ON9x7iCN6Z6uWvhx9qu7ENoFe2WclUiBxdtcSyzK
	bdXdM9D/7k/rXy6deEVCtWKZaIMycDwrhfwnE1qwMKr1jqYR5SXZnPiL5DRqZ1uVBD/P5hb5IEc
	EI3hh0mRFWpMk1MrymZF+XjmqONBLsS3ybpBxREYvHSx6O/0HDJ3yfYEUwGENupOMYTgviCX6+m
	QlVGDqc1rRvraDBsnD+GSubRlVDTbXIbIC1cZlBhHOttgIyqQroaJ60BN2s50
X-Google-Smtp-Source: AGHT+IHn/21/SOrfrmmxZ3tPAkNLTaBJaR5/CywcSjXOiXmrdICFMI0m5aOb6rl1npEAmIDqASJOVg==
X-Received: by 2002:a05:6102:1612:b0:524:2917:61aa with SMTP id ada2fe7eead31-53d2490d7a8mr5177726137.32.1757490327203;
        Wed, 10 Sep 2025 00:45:27 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af191584fsm12459598137.11.2025.09.10.00.45.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 00:45:26 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-53042807be7so4721790137.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVQhw3DjoWKiM22Mk926zkNPFCNSPfKu4ydg9dqiz25qYUwrdgw7a+1ATbAalPEkQqYzrSXg9pyBu+@lists.linux-m68k.org
X-Received: by 2002:a05:6102:b11:b0:4e7:7787:1c2a with SMTP id
 ada2fe7eead31-53d231f9656mr5104922137.23.1757490326480; Wed, 10 Sep 2025
 00:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909145243.17119-1-lance.yang@linux.dev> <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org> <875xdqsssz.fsf@igel.home>
 <d2942b1a5d338c35948933b0ccbf3e4f67e5fae2.camel@physik.fu-berlin.de>
In-Reply-To: <d2942b1a5d338c35948933b0ccbf3e4f67e5fae2.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 09:45:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwqqRiBJJwkPURkrEjbGbE1mY_NQ-hc56svzdOBOuBWw@mail.gmail.com>
X-Gm-Features: AS18NWBHwc8YE6Vdm_IGDbqHFO8ujroWnx8LY6VMHBDCK9GOp8Is_tBUl9ooEfc
Message-ID: <CAMuHMdWwqqRiBJJwkPURkrEjbGbE1mY_NQ-hc56svzdOBOuBWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock pointers
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	akpm@linux-foundation.org, amaindex@outlook.com, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, ioworker0@gmail.com, joel.granados@kernel.org, 
	jstultz@google.com, leonylgao@tencent.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, longman@redhat.com, mhiramat@kernel.org, 
	mingo@redhat.com, mingzhe.yang@ly.com, oak@helsinkinet.fi, 
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
	tfiga@chromium.org, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Wed, 10 Sept 2025 at 09:39, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Wed, 2025-09-10 at 08:52 +0200, Andreas Schwab wrote:
> > On Sep 10 2025, Finn Thain wrote:
> > > Linux is probably the only non-trivial program that could be feasibly
> > > rebuilt with -malign-int without ill effect (i.e. without breaking
> > > userland)
> >
> > No, you can't.  It would change the layout of basic user-level
> > structures, breaking the syscall ABI.
>
> Not if you rebuild the whole userspace as well.

Linux does not break the userspace ABI.

> FWIW, the Gentoo people already created a chroot with 32-bit alignmment:

That would be a different Linux architecture (m68k-32?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
