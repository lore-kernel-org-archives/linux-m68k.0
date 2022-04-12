Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC91EC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Apr 2022 19:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354633AbiDLT3W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Apr 2022 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355439AbiDLT3S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Apr 2022 15:29:18 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B5649259
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 12:26:59 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id t207so13175570qke.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 12:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k0JEyUctm+WKncuIF5YDm3I/aHHGOlYRWAe57/MVe48=;
        b=ov8ZuDvcWYJl3T4d6CSf9qxlzOINF1xSbciyGYdFs+2wWh/DO9uhcewhP6UgxwphOx
         l+vXlqb7KGrSVRWsA29vB6Q6DQOsI9xvUXV4tp9G9pkbSVWVMhkEAJs2ASif+Thu2zPb
         aZb2B+LgpzW5mnGGeoTyw3jbNPA9eMzbLAtC5tp++rxOJhBi1S52fPnyEfxu4t8kTxKA
         wBBgBly+G53z75jDdnudGv1rZGPxF0YQll+64PTBO6XOMXZH171JKguhEBIINtCVZMmt
         czDrocDzXrrYofFHP60eoss5eNkfIbLgFcjIJ7D2uOJr/0IdRTfQD0gs5zse5ga3YJwm
         VQiw==
X-Gm-Message-State: AOAM530jWVn4wkeYSUQF/4qFZujlcYeZdAv3wiOuZe4q5kXunG2kKpKU
        3hkxmvmIdHnd743lCBYw81iukJTn+sVarrRV
X-Google-Smtp-Source: ABdhPJxYNTgnQG2tf+PZKS66Bnnw/dNdQOv68mGxEByb6/5WeDIkmI1thuSX+rT11StM+DzgaAP95Q==
X-Received: by 2002:a37:4c5:0:b0:69a:115a:4725 with SMTP id 188-20020a3704c5000000b0069a115a4725mr4417549qke.83.1649791618766;
        Tue, 12 Apr 2022 12:26:58 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 200-20020a3706d1000000b0069c532cf4e5sm24244qkg.50.2022.04.12.12.26.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 12:26:58 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id x200so11154893ybe.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 12:26:58 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr5208597ywb.438.1649791608129; Tue, 12
 Apr 2022 12:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220412172754.149498-1-Jason@zx2c4.com> <20220412172754.149498-3-Jason@zx2c4.com>
In-Reply-To: <20220412172754.149498-3-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 21:26:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXexfkgfrLcUis3DSWJ=SSC-CargHbMvopsjoWrvNacFg@mail.gmail.com>
Message-ID: <CAMuHMdXexfkgfrLcUis3DSWJ=SSC-CargHbMvopsjoWrvNacFg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] m68k: use fallback for random_get_entropy()
 instead of zero
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 12, 2022 at 7:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
