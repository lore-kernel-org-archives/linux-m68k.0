Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB73C73E1
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Jun 2026 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398510; cv=none; b=ZQOvU5Zteu1WrxDz87vBjhq1o1/51XTLcJI/fIdqecmuIQv/4Dpi0Q+xp5ks4Jmr+l08LGNK2ivxURhjRFWsE3Gk2EH7uJsC/ksxlYv3+4LvsZ5+XP33ZR7BbaTzw3Yl/cyJcpvbE92hK8PKRNcS0U4MIUgm9Xmn4U468Uc3z74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398510; c=relaxed/simple;
	bh=w4cVZ+GEEmsXcvgIG+638F4NIv19Md0kqYcXlU7oLSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6cGhEW5dbMyStZfYzucuoege/LQNhHyxbN8q3aQuQX9OqYCx+vsVmS63x42GgPzAUYL1891WhzcvjRQNHt173jSDpf7JDf771zcZw2kFKnbFsmUWeLu3XPkGJ8gQ1wQgqTUPc9LyvCMEkApPQBncK20p834q6wehOJmivE8XkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso942634e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2026 04:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398508; x=1781003308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmBJp0H5QWVh7p9vKLYuhNsufNBwSQXXDZceAK3VLwQ=;
        b=MXtJ3hBn9+tL720TgfwlR00qjjehNnxtzxXsXMnAQAZ19kLMqSOKW6y4tGAvzW8q8E
         hLoOf0f+hEokMAT1Ix/U1yiUxRNRxa2Awrxv/spcBMPUbykorcIIcssHJIOJcSDxokML
         0aaNENzkSpVhbw2+vbLAFSLsZIVBmEPNlhn6+8cRYzgGr+zh11cCoXvyDZbMg1O/AUrv
         UGvbUrjqxSBnywTqARjEbzqdotyPhztSVaY7jyoOKs97XbWzL0yqzVgGZpLjvS4Qif0J
         aXVeY+VUbrr7jfw6kOPCo55Lp0VBllFEAxFdhx5/KtQZjrQLZCJCvLbusi2KAE+rwJQn
         Abxw==
X-Forwarded-Encrypted: i=1; AFNElJ9rBXSx42/hnw4KeADprW4D2jre2MNOCovkqM0FZbUZm5DjuQCXi6XjTh7qjSO20QZ2ZUfIVrv9zUGH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwOeYkuoVn8ctFWAk7/m//hkv+lNt2FPUHSEhcNqN2NIMl3zdu2
	Pxv1AaDIIivYnVMDqMuN8DFPyb3aUn6CiryEKswOmAYsW0Z8Mz85/ibNqXyxdWlm5LU=
X-Gm-Gg: Acq92OGcRJ30zqZGTAHYvj46k8Q4tfjP4XyyO0KgV3LRaoCfdxktgIenBpiy+qyiAtd
	PJ1LbkHDJp5YOYAFO7KhzwBvLdZXmselK/MTIHB+1/Tinq9kSHmqi0zB86IfHMcRpSh9244Mt8X
	1DImEVQMTST/9AToFIpHr17FJET/TaYHuRY4FUoq191CzlIX24UpK2XvzKQTL/1a5CXbb/gldvh
	L6E+x9ahe3MBIn0l8og7ZYVkJv19yRh/ZKhWeN/iX4cvdatUrn+vghK8s61aQCrlJ2nzhqsYMpz
	3V3dGQHgovQirus4tXy2WSuRXoNQqmYVrLzENbOjT10PIzSS8WXw0oX140dKkvSjy0XqTHLM+zr
	moEiznRXU+DOxZDeby/MR0d0KCy9y3CMFA+2MxoHGcTUD4IjmLUgM09D+P6jsFxG91VWjGW6tjw
	O3U1l9TeMV6tKfpk9DkrO0PLMDyKVnUhAPSKi+yBrQr3hCj2w29pub+u1haoPXX0LLMSGzanI=
X-Received: by 2002:a05:6122:311d:b0:576:c4b:460a with SMTP id 71dfb90a1353d-59bf29e8769mr6875869e0c.8.1780398507631;
        Tue, 02 Jun 2026 04:08:27 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a3e15e30c9sm2818926e0c.16.2026.06.02.04.08.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:08:25 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963ebce7076so340038241.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jun 2026 04:08:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LZ3CPfKbXJVJCNXowzB79cjKEt0kIaPl8q8fmdHWEoQs+QdSmNwS+fUXfoyLkdjuTSmYQIGC81TKW@lists.linux-m68k.org
X-Received: by 2002:a05:6102:508b:b0:62f:4387:fcb4 with SMTP id
 ada2fe7eead31-6c67138855amr5868354137.0.1780398503695; Tue, 02 Jun 2026
 04:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
 <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
 <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com> <42ab8311-0bd1-4094-aca7-0ca108c3a919@yoseli.org>
In-Reply-To: <42ab8311-0bd1-4094-aca7-0ca108c3a919@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNiUGnjRkhwVGpgHcjTSzoLsFmaPR_TfROsFhDbYqUUw@mail.gmail.com>
X-Gm-Features: AVHnY4JVCja7EHQPoaeG9BcOIzzhjoN-O0H6mzbdbiubMmzzjv1Hj931kn5hpzs
Message-ID: <CAMuHMdUNiUGnjRkhwVGpgHcjTSzoLsFmaPR_TfROsFhDbYqUUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Tue, 2 Jun 2026 at 13:05, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le 02/06/2026 =C3=A0 12:04, Geert Uytterhoeven a =C3=A9crit :
> > On Tue, 2 Jun 2026 at 10:36, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> >> Add an rtc-class driver for the Freescale MCF5441x on-chip "robust" RT=
C.
> >> It provides the time/calendar and alarm, and exposes the 2KB
> >> battery-backed standby RAM through the nvmem framework so userspace ca=
n
> >> preserve data across a main-power loss (the RAM is retained while
> >> VSTBY_RTC is supplied).
> >>
> >> Register and standby-RAM writes go through the RTC_CR[WE] knock
> >> sequence; the base-2112 year encoding and register map follow the
> >> MCF54418 reference manual. Based on the out-of-tree Freescale 3.0.x
> >> rtc-m5441x driver, rewritten for the current RTC and nvmem APIs.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> >> +/*
> >> + * The time counters are unstable for an oscillator cycle either side=
 of
> >> + * the one-second boundary. RTC_SR[INVAL] flags this; reads during th=
e
> >> + * window return 0xffff and writes are nullified. Spin until it clear=
s.
> >> + * The window is only a couple of 32kHz cycles (~60us), so bound the
> >> + * busy-wait tightly: it runs with the lock held and interrupts off.
> >> + * Caller holds p->lock.
> >> + */
> >> +static int m5441x_rtc_wait_valid(struct m5441x_rtc *p)
> >> +{
> >> +       unsigned int tries =3D 10;
> >> +
> >> +       while (rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL) {
> >> +               if (!--tries)
> >> +                       return -EIO;
> >> +               udelay(10);
> >> +       }
> >
> > Please use read_poll_timeout().
>
> As wait_valid() is called after spin_lock_irqsave() is called, I suppose
> I should use read_poll_timeout_atomic() ? Because read_poll_timeout()
> sleeps ?

Sorry, I copy and pasted the wrong function name, so you're right.

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
