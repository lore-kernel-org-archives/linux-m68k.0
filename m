Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7086DC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Apr 2022 11:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242865AbiDNL75 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 14 Apr 2022 07:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242866AbiDNL7v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 14 Apr 2022 07:59:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EBD888D3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Apr 2022 04:57:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D98ABB82921
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Apr 2022 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E6CC385A5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Apr 2022 11:57:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KqULyDW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1649937439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P5/ULzB2dBV6wVJcVqNwMtw/WLd6F6dq7ksMxHzz5tA=;
        b=KqULyDW2bpNuV43D2qfWcLectqKb2+7LIu91z7Q5tNQEiQHJqWtgnzvY6NqNuYPtq+cgRe
        tg79MdGbG9du4wXdelQZLIoTe7afsL/n2nIea9nRhw//O5bqgubZJiGBapql2hSBobsFeS
        bOnl6O1rryOEcTmj4DTw28tt+f4lj9g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69f10dfd (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Thu, 14 Apr 2022 11:57:19 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id t67so8974829ybi.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Apr 2022 04:57:19 -0700 (PDT)
X-Gm-Message-State: AOAM530bvF1gSwUVbBIab2sPR7E2oeFKu+L49pNWgtUWIjBStiSDLkmJ
        V5Lj1eclwmMoyGseYM0yqs82DrL0Wy1lk09zR3Q=
X-Google-Smtp-Source: ABdhPJyKcg613GF5x9fgeLFiZXh8/mhAmu2M+VzMPDTSDm44Qulp172KDH/PBSl3qtPO19ZfXo8qsw8aP1vhDQLRj1E=
X-Received: by 2002:a25:fe0c:0:b0:641:2884:2c7e with SMTP id
 k12-20020a25fe0c000000b0064128842c7emr1344925ybe.382.1649937427424; Thu, 14
 Apr 2022 04:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com> <20220413115411.21489-2-Jason@zx2c4.com>
 <Ylfzi1lNWTH1wjLA@shell.armlinux.org.uk>
In-Reply-To: <Ylfzi1lNWTH1wjLA@shell.armlinux.org.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 14 Apr 2022 13:56:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9q8R+uHNF_VBkJezfWn78kyw0RgGf-36JJKs6t3h3wQnA@mail.gmail.com>
Message-ID: <CAHmME9q8R+uHNF_VBkJezfWn78kyw0RgGf-36JJKs6t3h3wQnA@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for random_get_entropy()
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
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
        Max Filippov <jcmvbkbc@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Russell,

On Thu, Apr 14, 2022 at 12:12 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> I'm surprised this didn't trigger checkpatch to warn. From
> coding-style:
>
> 6.1) Function prototypes
> Do not use the ``extern`` keyword with function declarations as this makes
> lines longer and isn't strictly necessary.

Okay, will do for v+1.

Jason
