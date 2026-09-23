Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142753D9CC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174800; cv=none; b=I/F/kFodEYeOTk/fz9CAwYCtmj8REF5oaxIZ9rH9DzGwhToGGtR5Gl40zsYOmLdNnKhEnapkOvJd8YTLupOhJ5W8PrFZEHKaJmfH3sMFmb7GQCl0ypKnqkGrmv0v0ZiVWKVCSUezP+dgNSxTMTvn/HwUYg1RF7jVColt8PEOqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174800; c=relaxed/simple;
	bh=HAiG2uKeueum3NwR1fOOATsx3Nfb/2XuIB0lowPT5AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rX8SJGVV8MVh2xXeOz94RoRdlehy9LsxGxK9c6ELkitEc39bWq7/HT7lOOf9T0YNLr/stM61uOK3M5t/SV2KWa5HH0QQ+cAGc5iozsgd2YeGfJSHg1tpWUq/7KRK84PoEzOJ/VDyEzLU+Hn3Cp3sbIlMzb8Dqk3vyR+tAnbgBEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf30817so15515887b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174798; x=1790779598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QXVYin3gKtafVdGEnWDbswOTPSZ/Xq4fs9pj7jQGAU=;
        b=G/OgUN4HyM39k1b9aNt3wFfP7HS1JzlZvl3WIewTRL+0bpQqihbL1zyp9/3OEePVpQ
         1LybcX63NS1ueuq9HY4sg3qogX4maZexwRzEFSG5Ru9FjFeAZZaiYNTPDBaSdRUtbeG5
         bBMrJ/pvGDmd2zs2vCBKhJyLeJd/pIc5g1C8IrDmiys32sJyu/mUZjFREqfqum7t/XBy
         VYz235n8riRQy3bATLhT30nsC/VvUz08+0h14FAumtWNxnlHyEx/e+rfUX9alqGG0L1r
         MUnbtxp1cBDapCSZsTr7n24mJ7Yik3WCsE1wZOgSFWsjDcH5p9qN/a4u2Khz1Xzsp1xk
         9PGw==
X-Forwarded-Encrypted: i=1; AKwUvBziE3ACME02/gW96D3AtpLXwBfHNCMAqu9ZyMtX5FvXy+5sZFtg7dchgDVYa1DXpN43AUYZk3FVuzrW@lists.linux-m68k.org
X-Gm-Message-State: AFuF++livLB/8xVJmTDYaTPafqP9gk+7Bi7SZYN9hV8Lr7f2KJhO+11I
	TKuzYbp/gCjO/nm+oKtTbRqkD0CSU931X8t90m7sCYX3gHdV2FkrKo9t/B+FxyMp4oI=
X-Gm-Gg: AYBFou2ccA3m9+rf0cN6kHVhTw56ZHEKj37mJDFudbHsYDFVN+0WmLc03lav3jeKRma
	zMUam9hQE3xnETs5zobQqH3V0RQulGKYJLgqaB1OuJyizczYLklRS0qwFH6wN+OjCX7gv/P7cxi
	+K9VtpsgSKIxHH9Qrzu/DpQctaQ6eGbgy4wcNZm+EN5t+HGUF9tSUmGvj0T0Bg2Ek+q0PBKXPAw
	60IRgSfB2CSO3TlxvKjS5OcsnYy4O8jMbt+LKGziLR6/6HGRM5cvZpMKcl5xdcspGzvxHrJByrC
	O/cWpisDOFr7UOBPmOsu3l5+EMmRighbhjOUVXcmNNdNEbAYXE6L/GzrYHCb6WrD9MWtVp1QxVm
	l9vyouF+w3q9Pj0rLxerloIJDfLUDd/aBxqRboDEwPEgKlyD9adV14XMkjpSdyfPOPB9sQqnv5a
	gKDrE4nCVG6EpqWM+MJ64OpGpQ8yuEZO3r2o/8fKylTHiA5m1DVrS9vhGsJ+7udJFt9TxSuJ5u6
	OB+na6ctF1r7oES+9k9FjxLcgvfNkAbfw/bhtg2y5cvw5Zj
X-Received: by 2002:a05:690c:6b01:b0:873:5bd1:98cf with SMTP id 00721157ae682-8a45c07e392mr14906617b3.65.1790174797591;
        Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a5af050d44sm2350587b3.16.2026.09.23.07.46.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201f9so961999d50.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYtSFNq7EIy5rPMya/jA6F7nqM2ijuQ6RjNmSnLB3+8B0l2sJftc2Vu2hoFzwgeyvopq/8888T3L4Z@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id
 ada2fe7eead31-7ac1bb45468mr2431267137.12.1790174453060; Wed, 23 Sep 2026
 07:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907134037.1855408-1-gerg@linux-m68k.org> <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org> <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org> <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:40:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
X-Gm-Features: AclHuK8JOpxbtBL9eo2JZ21xOlmZ2HJ-Q_I8grURwALj-s_IRRLbJXlaWaj0iq8
Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, arnd@kernel.org, wei.fang@nxp.com, 
	frank.li@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, nico@fluxnic.net, linux-can@vger.kernel.org, 
	linux-spi@vger.kernel.org, olteanv@gmail.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 23 Sept 2026 at 16:16, Andrew Lunn <andrew@lunn.ch> wrote:
> > The driver will always need to support big and little endian hardware, so I
> > am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Unfortunately not.

Quoting Arnd:
   "fec is an exception to this because it happened to rely on the
    unusual macros: all the Arm SoCs using this hardware have little-endian
    registers (regardless of whether the CPU runs as BE or LE), while
    all the coldfire chips use big-endian registers (and don't support
    LE kernels). The powerpc variant of fec also uses big-endian registers
    but has a separate copy of the driver that hardcodes this. Other
    Freescale drivers already have a runtime endianess detection that
    is needed because they built both BE and LE variants of the hardware
    on Arm SoCs that could run the same kernel."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
