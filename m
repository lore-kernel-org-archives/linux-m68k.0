Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B14BC35273
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Dec 2020 15:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4009F23B6C
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Dec 2020 15:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgLRP4r (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Dec 2020 10:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgLRP4r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Dec 2020 10:56:47 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36580C0617B0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Dec 2020 07:56:07 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id p18so1560176pgm.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Dec 2020 07:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=abkacR5EtfH7n3c7FX6aX1PPXUx2EG3knfWGOF7I8KQ=;
        b=CBfVYlZ7drbVWtqD4bM3rkW3OWAqtTHQ4tOTswiI8hMNopfxOrNSevY5aJbqvp0mM5
         TCt5A9KlDha/typLUMvAinFqZihBhKDs4BnfOvsBgN1UEuOfn2IctSX1c7RAJE00PX2w
         n7klcFUYA8+Wh03OFueMg42mGZ0RkQcUL9Og1KFLwVu3sptluQTtOKanGWeSuBQ6+cvG
         IQarphsJdlgszUZ2XFgxxcoIxIFcXYZtA7DiUUAY+OhzWh0reHMzfpVaZ6Tbo/44jQMr
         d42Q7DDFcqvQMmrXsNBpvMeT3nysS6sMGtm6mQ7XQdIwUbkG3/ZAqQL4skrB49QcSHxQ
         YUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=abkacR5EtfH7n3c7FX6aX1PPXUx2EG3knfWGOF7I8KQ=;
        b=JMTmuO8i/ZCZTG1AG6IAAmKEOOeNig7UalKFpB7FrMNZ8YFon9Jo1U91nmh8ydOhVP
         tHhdtTOvvbOCBDFH2Mz/Ha2CaLIXCwJaPdaYEcMzAMMj0VOnuJe4OdMmOngRrSeyd16G
         T7qTlGFXUvBt727zK1iBHNVOmFAZlqFyHKBUfNBQLqAILGD+Jfg95mULyfC14B3dmYht
         QcTs+9KD8V1MQ44NdwGlZ47eKoUIT+P+yNMNhitlLmfK53hy1dosYiPIabwT1m+Z7hqP
         4x9KhVl4yEw1UGVpXIXAv6K1sH5UzCaeHTHi/9gcocEKDu8SycavUCCM3HcBammWQTsW
         +v1Q==
X-Gm-Message-State: AOAM532UW+vHBCCiTvnEKGLddhindY4OSFQjrCcx+Mxz36FOgK9RmLAS
        wOPHA0b7DGodLKL69eAbbGZsb1j8k5Q1lYGdTd0=
X-Google-Smtp-Source: ABdhPJx7CKHKNahHF7wOhrRaWmRijCkWWyTNv/8H9aIqR6dzxIZFoFPjsHMLJGY+VN1uh1mCeWPnu3uWBQAXjL7LLn4=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr4683229pgl.203.1608306966654;
 Fri, 18 Dec 2020 07:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20201218143122.19459-1-info@metux.net> <20201218143122.19459-2-info@metux.net>
In-Reply-To: <20201218143122.19459-2-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 17:55:50 +0200
Message-ID: <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, msalter@redhat.com,
        jacquiot.aurelien@gmail.com, gerg@linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <maz@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" 
        <linuxppc-dev@lists.ozlabs.org>, linux-s390@vger.kernel.org,
        Linux-SH <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> +               if (printk_ratelimit())
> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
> +                               irq, hwirq, nr_irqs);

Perhaps you missed pr_warn_ratelimit() macro which is already in the
kernel for a long time.

-- 
With Best Regards,
Andy Shevchenko
