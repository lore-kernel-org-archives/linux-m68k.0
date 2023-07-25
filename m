Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713E6C001DF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 07:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbjGYHWD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjGYHVR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 03:21:17 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B3B26B8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:18:54 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a3790a0a48so3862950b6e.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690269534; x=1690874334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lrkzr5cvjosFI//uEK1aHD1IOI0Bz2cNenZQg3FVc4w=;
        b=LrPVYmuBzg7f6szTKCBJpZRoHqB/aDQH+LVAW6WrcbSChnoVxhn3g+j68QABWChcHL
         VnzGEPggz6Ai08JAS2doRNoG6WcAY+kv+z2GfiJEXvw3+FfEfu3XK4pdQzf7Y5SpPZjd
         SycXJJB20R5jxPGcTNJxJ3CWUm1GYRpGhcfPMAH+2YlqQy9rtp901d5cYHbuDsZYQAaw
         ZQ0nv2qiJNBIhp66Wxrt5iUYatvAYunKmSI3Zlx72K+eBd/qbQ8yTGHw5DsnQGyseDO1
         olkkFlH6a2x+ysWI4cSLrfxXo0T5TVMWQjkpFHLyDDtV5BKHxlKC8nlkxauQpukJOdU3
         xHGg==
X-Gm-Message-State: ABy/qLaVA1u/82vKVTBZR/l3WxDrToo1dEdkEBTgFsWg6nKccOucB9GI
        /lQuK/ZC+KQ/vbkwdsO4oymNoehZuqFgnQQ5
X-Google-Smtp-Source: APBJJlHTIm5NJLObKK3N0tNsxdNdNs6yDe0s3BMJ39agsX1NSRradghVXt1rQ5ky276AFQ0x9QRbJg==
X-Received: by 2002:aca:1213:0:b0:3a3:65a8:c12b with SMTP id 19-20020aca1213000000b003a365a8c12bmr11452033ois.49.1690269533493;
        Tue, 25 Jul 2023 00:18:53 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id e17-20020a056808149100b003a4825088ffsm4857314oiw.51.2023.07.25.00.18.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:18:52 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b9ede6195cso4452193a34.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:18:52 -0700 (PDT)
X-Received: by 2002:a25:b07:0:b0:d07:bce0:be77 with SMTP id
 7-20020a250b07000000b00d07bce0be77mr6021730ybl.61.1690269511226; Tue, 25 Jul
 2023 00:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230628230935.1196180-1-sohil.mehta@intel.com> <20230710185124.3848462-1-sohil.mehta@intel.com>
In-Reply-To: <20230710185124.3848462-1-sohil.mehta@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jul 2023 09:18:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4HAMD5PA8OOsTGvx_1LuUw=Stegtcb9KQFVa-CP3T_w@mail.gmail.com>
Message-ID: <CAMuHMdX4HAMD5PA8OOsTGvx_1LuUw=Stegtcb9KQFVa-CP3T_w@mail.gmail.com>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
To:     Sohil Mehta <sohil.mehta@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Sergei Trofimovich <slyich@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rohan McLure <rmclure@linux.ibm.com>,
        Andreas Schwab <schwab@linux-m68k.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Brian Gerst <brgerst@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 10, 2023 at 8:52 PM Sohil Mehta <sohil.mehta@intel.com> wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org> # for perf
> ---
> v2:
> - Rebased to v6.5-rc1. No other dependencies.
> - Added acquired tags.

>  arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
