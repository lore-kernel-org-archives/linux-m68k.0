Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0330EF89
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Jun 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394664; cv=none; b=Z2epRFFJQmlas3KFEj5vkuDmR33y2Q5dcmRXrNvovNgoVYIs2f+dHCHl87fyCWHQrySYk7DRwdp05Ipi7vj+ctlpsVF2T9onQi9YYsDQrklHwrt/kmQWGBIDbYplga9aJR8Mh4yXKdfu8LnboAfDTSo1bjIbg0PxYRRh3/53jW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394664; c=relaxed/simple;
	bh=Ea5t9LU0c+E0Np/MRy9NQ+SZbqytR+N/QwChEdmuXPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yjpw6ZOvnkYkjhw7SFJQaHTQo8Wr2tOMmgCvwRedQNZ69mqycO0AssPH7roIT6CgDkqR7kdrtPen6glicHfm2ykjqMoZgqvvC6fvJciugfaC/QIlkaLbnISvFDuwW6XWAu2i61Vk65VIUQ+SnvS3JeGDQCP/aEej9kyM3Q6hiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1127234e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2026 03:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394661; x=1780999461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsi++kCMTnpEzu8NDN4X9CZco+DOpY92AKyIo3iOHqg=;
        b=YRD597Pibo3VDtrAWawY3FGZ9cucQAG7xiRh03dEacjeey2EPB6eqM0/MH1rb2wS3x
         N/VJrxG3Z7Xd63CF3TincbEGJ1ZZh3DOP9BNqN1MU+GYEJfKVVS2VKPdRNcMxRSfPR7s
         cMUUPh6A15HWMkJw/g8IQnFfEOrRURKSqwr6bU6RQtdxceCIMzmh7L7fHzaVSG92xwTA
         SW1oxjxjyqSJ4j0XG+ZJm4S757s1n1F6QyEeILf76He6PsMSbRFf/TdyA2ZaWgoIvPaz
         NQEqkahZCFFAJS26qnWL1bjgkrUzU2jJCy/mYqk4onaa70F6T8Ga2b+92d2Ofs/NAQda
         iAFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1EV9QJT1CB9/nYvd3otCixerJpPu08ZLsJjCSHK+FgDTx064R/nyHCN6qfIj7w76jMjuBoI++/UJt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyKlMsOb7CEGIxOJ4ZUGHD2BO9S9/G7RNE1g1glrZQti/TnDQNF
	z5ecEQApd4R7pjcCpQYgEoSlpYkNsBWprisSI3hOqpNXO/JqisTNEy0/U+OjeD2k
X-Gm-Gg: Acq92OEXOVWYOQv5E6HqnnS01Q5fcJEbHzunWojF0AV1NEai/qJPyG18scPVT5Ar7Oq
	aNDbRoxN4YmK2betdk4mh34kZKTpY/uGsLYUHwyg803PGOa5WMpskI1qIg3ok+7coEllsOnvfAT
	tjmvXxYFgCNRzd7QCfJz5VUaurQgugJJXd1mRnNWMj7omxBir7gxiZ74ZfhEwnthxYf1ojz6Pn1
	fsx1w79WHYTcjeqGVziTBfrtKJYpna5jKRPtKQ4hHDtOPagUoZ/4gYuClnXR+cfutHugtKdUr6e
	SttQ+v1ajxt8vbNduY0k9oRzXJdPYQP9DcFWnv58OIJrpoe7ZLDiXNDz1SRyi+nZFWKgGkT9RTe
	KKO9kGGHZM0a1DzWIiiyKi8s20qyj3aPskf4niQpRBgMEE7BlfSEV0EdlNL1kwkdnSnoKJRi70U
	QvjcdCJ1hf9vWOCTvYKT1hwAA9hoECKyjFLTKfawoCj0ABjJncjiRPtElsDQ8MONsJbrpEO/l/s
	nZ1un2UVYE7Xw==
X-Received: by 2002:a05:6122:506:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-59f8ddb3269mr4893277e0c.7.1780394660760;
        Tue, 02 Jun 2026 03:04:20 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a1cfd9c343sm4328685e0c.3.2026.06.02.03.04.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:04:20 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59f967189e7so805188e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2026 03:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/i8td18b1BasqjMJkIL4iGKRdYNNUYzpY/Ha3h5lpQHhjskO5P21pYFpqDZlQShcsOo8a5CGtsLMPu@lists.linux-m68k.org
X-Received: by 2002:a05:6122:4698:b0:573:a6f2:65f with SMTP id
 71dfb90a1353d-59befdf2088mr7420983e0c.6.1780394659762; Tue, 02 Jun 2026
 03:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org> <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
In-Reply-To: <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 12:04:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kzspu0wT1kEtg4hVeMMR3A3i7ZjriZGlBqIf1xjLhjzQQegsSVdUezvag
Message-ID: <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Tue, 2 Jun 2026 at 10:36, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add an rtc-class driver for the Freescale MCF5441x on-chip "robust" RTC.
> It provides the time/calendar and alarm, and exposes the 2KB
> battery-backed standby RAM through the nvmem framework so userspace can
> preserve data across a main-power loss (the RAM is retained while
> VSTBY_RTC is supplied).
>
> Register and standby-RAM writes go through the RTC_CR[WE] knock
> sequence; the base-2112 year encoding and register map follow the
> MCF54418 reference manual. Based on the out-of-tree Freescale 3.0.x
> rtc-m5441x driver, rewritten for the current RTC and nvmem APIs.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> +/*
> + * The time counters are unstable for an oscillator cycle either side of
> + * the one-second boundary. RTC_SR[INVAL] flags this; reads during the
> + * window return 0xffff and writes are nullified. Spin until it clears.
> + * The window is only a couple of 32kHz cycles (~60us), so bound the
> + * busy-wait tightly: it runs with the lock held and interrupts off.
> + * Caller holds p->lock.
> + */
> +static int m5441x_rtc_wait_valid(struct m5441x_rtc *p)
> +{
> +       unsigned int tries = 10;
> +
> +       while (rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL) {
> +               if (!--tries)
> +                       return -EIO;
> +               udelay(10);
> +       }

Please use read_poll_timeout().

> +
> +       return 0;
> +}

> +static int m5441x_rtc_nvram_read(void *priv, unsigned int offset,
> +                                void *val, size_t bytes)
> +{
> +       struct m5441x_rtc *p = priv;
> +       u8 *buf = val;
> +       size_t done;
> +
> +       /*
> +        * In-kernel nvmem_device_read() forwards offset/bytes verbatim, so
> +        * range-check here rather than trust the caller.
> +        */
> +       if (offset >= M5441X_RTC_SRAM_SIZE ||
> +           bytes > M5441X_RTC_SRAM_SIZE - offset)
> +               return -EINVAL;
> +
> +       /*
> +        * Process the transfer in chunks, releasing the lock between them, so
> +        * a full 2KB access does not keep hard interrupts disabled across
> +        * thousands of slow on-chip MMIO cycles and wreck IRQ latency.
> +        */
> +       for (done = 0; done < bytes; done += M5441X_RTC_SRAM_CHUNK) {
> +               size_t chunk = min_t(size_t, bytes - done, M5441X_RTC_SRAM_CHUNK);

size_t looks like overkill to me.

> +               unsigned long flags;
> +               size_t i;

Likewise

> +
> +               spin_lock_irqsave(&p->lock, flags);

scoped_guard(spinlock, &p->lock)?

> +               for (i = 0; i < chunk; i++)
> +                       buf[done + i] = ioread8(p->base + M5441X_RTC_SRAM_OFFSET +
> +                                               offset + done + i);
> +               spin_unlock_irqrestore(&p->lock, flags);
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
