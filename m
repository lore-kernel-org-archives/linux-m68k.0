Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073A9C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 12:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC8AC60EBD
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 12:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbhJZMdM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 08:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236010AbhJZMdK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 08:33:10 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7B2C061745
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 05:30:47 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r12so13738329edt.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LpU1v1dCuk7vKXavVtDbZayvAGEHB3SBMD5EXFZtZ6k=;
        b=fe46ol5lw3cD3afFUi2Umx428YjXhXauuaDDsblgAAw+0aRcBFpXqFGN8XMdJKeeuo
         KHF9cj6Pkok3CbwZzy/6edsBY5G++LMIOvs73daqx1UiQh/VmFsm1OPd0G/H5Kv0yyAd
         AxF+97+un7EqZWPCTtNfS0D0kzAGJCZhfx8iGyp2e3PT4xtlKSSe3zLjWghPNm1/O7Zh
         QlzuaVqJTGHF7A0Pn4aUiRsQNjFUNwQ/EzbMXEQLbzLDzL6Kqm0yhDtWgb7BGwOMU2PM
         pftDvA69DC+Q15tP5ZMlCilyigE8oGVblNNTzs3ZOk7IHqQMZE5GAx5RJsIIHOTnBQSM
         ZUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LpU1v1dCuk7vKXavVtDbZayvAGEHB3SBMD5EXFZtZ6k=;
        b=QZbEXZ15YRJq5AOWcvhNAvo7CvkLgB86vW+jz3P4WTum/0TMv1JSgmqHRF3PleMnku
         PbqVlmNXX7U5KfdieVT0TEFXawVy5y0uDS6u09OIHw95hay3Y3d/+sNmMgwkJRweUMz5
         yVVZxdA5Y6r+b4XIDNun6cPEyw6a7NVNPTsZcSA+l1FRxkRiob/j9/gjzc17PX15N2ZW
         FkgQ+GMMlPY4fgxHCmn+PIFOnBO5N65pTfKeuGrfOajTunbCeUFhKBe0oV6KI21WW4as
         vunTqhSSqd2MVfLvxUoyESl4Yl1T+pjR1TBT0EOtPyj46hli9lq4CE8q0DmRrV9kzABi
         pzXg==
X-Gm-Message-State: AOAM530YoeHEkAu+9uWOmDIYhU7QHeu9Rw5hfGQGNuexcw4CHdLjz4rY
        s9OivFl6t48nXkWIglfSLALACjspyb2I4gMlTTU=
X-Google-Smtp-Source: ABdhPJw0HwSHJV1o+S4gqxwSQ2Ruk381U5XPFNCv7XzCLwUlUVolOdGkUhptgIdDY6mQTWN+g8ZKQaN/RBZ1IjUziGY=
X-Received: by 2002:a05:6402:5194:: with SMTP id q20mr4402850edd.294.1635251437780;
 Tue, 26 Oct 2021 05:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211026100432.1730393-1-arnd@kernel.org> <20211026100432.1730393-2-arnd@kernel.org>
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Tue, 26 Oct 2021 05:30:26 -0700
Message-ID: <CAMo8BfLN0Q+_K2fP9KVBPyqAMahtCSZB1MwLBRtQYcK3R35N7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Chris Zankel <chris@zankel.net>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-snps-arc@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        linux-um@lists.infradead.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 3:06 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/Kconfig              |  1 -
>  arch/arm/Kconfig              |  1 -
>  arch/arm64/Kconfig            |  1 -
>  arch/csky/Kconfig             |  1 -
>  arch/m68k/Kconfig             |  1 -
>  arch/riscv/Kconfig            |  1 -
>  arch/s390/Kconfig             |  1 -
>  arch/sh/Kconfig               |  1 -
>  arch/um/Kconfig               |  1 -
>  arch/um/kernel/skas/uaccess.c |  1 -
>  arch/xtensa/Kconfig           |  1 -
>  init/Kconfig                  |  8 --------
>  kernel/futex/core.c           | 35 -----------------------------------
>  kernel/futex/futex.h          |  6 ------
>  kernel/futex/syscalls.c       | 22 ----------------------
>  15 files changed, 82 deletions(-)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
