Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC3AC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Apr 2022 08:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386317AbiDUIDj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 21 Apr 2022 04:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiDUIDi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 21 Apr 2022 04:03:38 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429B812621
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Apr 2022 01:00:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l7so8373510ejn.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Apr 2022 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IvbH4EZL+5AN5QzEHqEkY2O3ivfSAm4vpHw9+hhvBhg=;
        b=l9A2zxVr+iaQxUxYrdl2Ms8QPgKKprVPWu836jDS1a9kDgOF87eiKg/WQ2Pp7p0uU5
         2yNRXou7K8UFGozJ+zY/Z4nvAWfNQL2rfMjP+xXVlPOuM9uOjKLpuuReXJ/1yNQdQwuh
         j0rwMLAJikQsK++NSTkjAZZIpdlqPGGrisobY6AkDBUSn+EF1pPZ26RV1iYw2+CmyG9Z
         D2LmcczIZ72xeD8VaXUH0mDdLEb2aoTOXjcPu5w7P06BXPfBaOVOvqtrL86fe03Il6B4
         EOW8KU+HycFTbAN4tLYJDkZ3tbTG01Z6v9mMOvBRakLpz/3LsxFq95QSfevhyaAXz0Qd
         bVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvbH4EZL+5AN5QzEHqEkY2O3ivfSAm4vpHw9+hhvBhg=;
        b=zjiNX7FWsGi6yjFRpSdwOX+w03U57HptVqwUujqk/MfqLRSnIR3cLJZgtUz7Mn/ch0
         vjEuuRDfztUAv1bUPcStN7GhTeI7JHYbwRmJWfWfqQhkjK3u1te5N3XqTtOhmxFR+Rs0
         yc4rxQi0AJ+/kv46eBcosrWHTAbZxitX2Ls5r4ayOIjmPDMh7J7G+tosj4r4qAApKLIB
         Jj9e0K4cQdj3Ab6jsVnmKdQWDTQNVolP8qczGn06TaXGcnbkSwUobp0Rn3H6CGH3X5WA
         LKeUyrnHwdw2Sr79L6hoU4JWcHndjvfSig6AfKPCK488JVL/53LfAWiPvh6f4efcxsXi
         tnEw==
X-Gm-Message-State: AOAM532t1t7aGcPLWYThwbeSlTOCqk2suLfRrATaj5BNwiYYnLqwsxoA
        Heb+nZbwT0+UWR7fdBZf+MPbtj96pSEH+9LFWgY=
X-Google-Smtp-Source: ABdhPJwZVRm8KFRbk9B79qovRjYyl5U7m19/ioAtyBVJMdSRPYNtjRxgrnX2fTY7SlA9nxFEZPk7MVR3ZDEQhaVY+/E=
X-Received: by 2002:a17:906:5e17:b0:6e8:b6b8:2b09 with SMTP id
 n23-20020a1709065e1700b006e8b6b82b09mr20915528eju.477.1650528047664; Thu, 21
 Apr 2022 01:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com> <20220419111650.1582274-11-Jason@zx2c4.com>
In-Reply-To: <20220419111650.1582274-11-Jason@zx2c4.com>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Thu, 21 Apr 2022 01:00:36 -0700
Message-ID: <CAMo8Bf+ox2MQRkqsTaOOXOchOWpb+7P8GQ1c-TjwSpDgttXoFA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] xtensa: use fallback for random_get_entropy()
 instead of zero
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org,
        "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 19, 2022 at 4:18 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
>
> This is accomplished by just including the asm-generic code like on
> other architectures, which means we can get rid of the empty stub
> function here.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/xtensa/include/asm/timex.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
