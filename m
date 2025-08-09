Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A96236A8B
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Aug 2025 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754739353; cv=none; b=m5LZri1U+p/cLOo1+vwaQH31LuvT1DORhrs/wf5/Hpe7Owmk6E79VpF3pIJLArGIhQnyTbs5Y1v/MFSbh1UqBuTBFVr6BNWBL0AydjD1BbbLhynRvTuPPw+3SaB655vAhXh90b7niBEi01k0zbHRj1fK8a4urhzxxb8q9n/295c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754739353; c=relaxed/simple;
	bh=hAW3jk3SWv/zmMCXhSe/RBviflJa+nWWURh0pkDB97c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XryYNYE3sHbfxpzXQovsv8Kb/z0MEN3ryW5LqhNQ/S2O3AdMubgygoreWHfjbz2+JTzd0OzWO27TMZVN4Lee59ILBpLabXINOqVR3I90114UvFxTw93b8dZJ6sNMz+HLrKNJqZC+T7MU/tEXI0Akz4yEEVpORMcDJQf2bfBCqEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=eToQbV5P; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="eToQbV5P"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-242d8dff9deso2883105ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Aug 2025 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1754739350; x=1755344150; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b++fcpyw+GzzUicUnmSZ84AlEFMozk230O+V6jAR5z0=;
        b=eToQbV5PhVa+90GNT3aZguw2F9G7MKEUZ2rOEq/jubzVw76sVC0vbf8Jf8okL99gul
         P1U5TgVWcVwnxuv2pU1x4cFg1WAauSEf1/YxltS0HJ/UICH/29BcU+D2/LavFhLiQFTq
         tNixs5YlEWkVCuN4lJmd+Ez9N1CbNendwWKBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754739350; x=1755344150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b++fcpyw+GzzUicUnmSZ84AlEFMozk230O+V6jAR5z0=;
        b=jLBIi6ftiNp8ViQmc/NSDkmQC4Mfr3pkpehBvxXPBJfEm+i2xU3ZD9A5kVTmxp7doa
         nCl4QGWTY8Wq993qVmi/UnBizaspjRQ6YGlCQWGAudjsyRUVXcUqO9IEdRHtfwJ3oKDu
         LvOfwNI9f4WtLMzIvjUgbEtNhUNIe1+RABRxzzuS520/yun8Eo7bQTh8iq3ztIueJE2E
         wxmJoT3UQdXtkUXwJE+ZdhZxtpgg4yMsG8H2v3Ca2lyUU6wbgm2eyU+RwLCb625daduB
         eCCThPz1bN5imkN+X6mdA+Ajq/PTi/tYEQA9Xu5qfcCUNPyv/MvqvzBCC+xHOVNPRnj8
         Vhaw==
X-Forwarded-Encrypted: i=1; AJvYcCUtRYSdayaNX72pyDZIzqYcR5iK2nOFXvH7iGV3N4PqO+POTK+kDBu2x0vYkSKlsePF5XQ1aHoTeAdV@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyCjso40Q/kECDps1bM0PCdu6tmwjRBApMoAs7B+FKGKtSBWkeI
	efunaPPRLNJFyeNusaK5AEyD/v+qkINUfkl5ccNrWQOvc8MLE5vNooJAHau+GvQjmIjPUv0wdWS
	tNgoG2k0GlumHY/igP66WOFSfFy1idDFs517XFpBSOQ==
X-Gm-Gg: ASbGncuq/XwgOFsCKPSxxvCjmF36SqpeIhve34/0OG3hlxvdgxvi+/ysunWFm5Hx1pc
	+FaAxR+b8j1Rc4U6LjdrtnRRfK5AgCZSjKablv1dxg6pOmUboQdCpPvl4UoyB98U7yrr7KR+xbT
	C8iYKdcMQxQIFBwLk9xVz7Tw+0i0mG0ej8Wt+x0t+gkXJtxC587t2llpbntHtqPXZ3BaNBIhtUi
	LpLFR9Q5M5hRxIsGw==
X-Google-Smtp-Source: AGHT+IGzRREk87eDFcaLlUsWZ9PxrWx1XRhbvbi/whttddVLyL+oWWmB0vbEIcGyw1gXOa9CcuXauxBv6QV2toNDEmo=
X-Received: by 2002:a17:903:2a8e:b0:242:d721:b019 with SMTP id
 d9443c01a7336-242d721b6ffmr23012465ad.38.1754739350354; Sat, 09 Aug 2025
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250809015529.373693-1-daniel@0x0f.com> <5dd0a031-dd7b-4078-b1a8-6b760248390b@t-8ch.de>
In-Reply-To: <5dd0a031-dd7b-4078-b1a8-6b760248390b@t-8ch.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 9 Aug 2025 20:35:39 +0900
X-Gm-Features: Ac12FXyKQaB-GamrPXjfDcjF8C4k1jrBhNp0iG68VhCNHX61waIkdj35RjCx0g8
Message-ID: <CAFr9PXmF-AOL8yj9FntHw+b1A8HWKNeAHU=rx7Dk7pfi1N_4fA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Add target for lz4 compressed vmlinux
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, 9 Aug 2025 at 16:50, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
> Splitting the vmlinux.tmp creation into a dedicated target would make
> all the compressor targets simpler. It will need a bit more disk space,
> but there are a bunch of vmlinux copies already in any case.
>

That's true. I think a target for vmlinux.stripped and then use that
in the compressed image targets.

How about this?:

vmlinux.stripped: vmlinux
       cp $< $@
       $(STRIP) $@

vmlinux.gz: vmlinux.stripped

ifndef CONFIG_KGDB
       $(KGZIP) -9c vmlinux.stripped >vmlinux.gz
else
       $(KGZIP) -9c vmlinux >vmlinux.gz
endif

<snip>

> > +
> >  CLEAN_FILES +=3D vmlinux.gz vmlinux.bz2
>
> CLEAN_FILES also needs to be updated.

Noted. Will fix for v2.

Thanks,

Daniel
