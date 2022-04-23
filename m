Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36774C433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 23 Apr 2022 02:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbiDWC1T (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 22 Apr 2022 22:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbiDWC1S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 22 Apr 2022 22:27:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0761B530C
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Apr 2022 19:24:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ks6so19621482ejb.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Apr 2022 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qqZdE0u9CYPlQ6MQcqOeN4oZEKzgzl5ZlEVKxJ+FAHk=;
        b=OE7s3CPe37nMb1dGmVaIey7JbUtRJ7f6vav2gncQroL5ziOpNrqKAczdsVbRdftZTp
         lvDGoua7DfR0a3ih2mXvBGp/pr8YIwFWvJ7rYtm1KItJ7lzb7bsnCbr0XO6Al/bLSqmY
         wShQ3Q4PeDbaGhthAQmvyUaYMWSIREyHdWzLfIHLlO4xqjeROrsWMsY/13vozvUovkD1
         TOAKaEV8j7EP/9ImivPEP7f9+9yBUR0jy0QdxfQqm1cDoP57+Iq+yV30nc+nepkuJNn4
         1e6bTF9LZV27/+Lsu7KDZ5aSI6QmdhEq2BG3Q9STkKqaymG9HXWUrXc+hO38EBpNkLCd
         yQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qqZdE0u9CYPlQ6MQcqOeN4oZEKzgzl5ZlEVKxJ+FAHk=;
        b=UORXib4ii3ULs3pPlkXCEIJsighqd+lPYVXB0Ny8pDeYhn9x7cuBJIYTyU6g6IK6QQ
         dHGqFr+mFbgtC9QkIDbe2ajlgnWZSQf9QfK521ERdcg+5jWRXSP++cVyaUzI9Sm8L5Qe
         EU9BuY5w7tHTUMgQ14cLZGlt5+7L8m3JX1lqN/o/LEP8PlNLzfi1w0+tzCLreKCWjiMn
         TaTeqgQ6wjmUspwwA5lvk7/my1e1Z/uiMoxm2Sunua7vF5Y4azfA7V25G+lRuXlagM/a
         ZA1M8Evnv18P34PHN7AK3Vk3QifB2UwVhZSkVtHtpBQFNFG0zqwygW9ZBE20JKICNO3T
         2GVw==
X-Gm-Message-State: AOAM533osWgwhOrKSBSOnIU9qj6MqFEJTXIdKSc3o+CzkYw18SuUp++H
        GRs+ljnCD+Nzpy+7X1fIeewDMAeo/UMxXgbRv9Q=
X-Google-Smtp-Source: ABdhPJzcIFiqsw8tqvA51BF/kojpRX8faca/GR9O0BKNi3Ttrspe1sgBeJ1OHPMIBfTzzBlAO8IBPBsJXGKx+2s4Z5Y=
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id
 b8-20020a170906d10800b006e87765a70bmr6585155ejz.436.1650680660905; Fri, 22
 Apr 2022 19:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com> <20220419111650.1582274-12-Jason@zx2c4.com>
In-Reply-To: <20220419111650.1582274-12-Jason@zx2c4.com>
From:   Sandy Harris <sandyinchina@gmail.com>
Date:   Sat, 23 Apr 2022 10:24:07 +0800
Message-ID: <CACXcFmksd3cw+xa-c2gEdd4=96PO8GCCMF6q2d6JHnJum2LjiA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] random: insist on random_get_entropy() existing
 in order to simplify
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
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
        Max Filippov <jcmvbkbc@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, x86@kernel.org,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Apr 23, 2022 at 6:37 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> All platforms are now guaranteed to provide some value for
> random_get_entropy(). In case some bug leads to this not being so, we
> print a warning, ...

Would it make sense to test at compile time? If there is no hardware
RNG nor a cycle counter, then the kernel should be compiled with
the gcc latent entropy plugin. Generate a warning suggesting that,
or even an error insisting on it.
