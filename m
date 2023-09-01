Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E50DCA0FEF
	for <linux-m68k@archiver.kernel.org>; Fri,  1 Sep 2023 17:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbjIARbB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 1 Sep 2023 13:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbjIARbA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 1 Sep 2023 13:31:00 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50A3E54
        for <linux-m68k@lists.linux-m68k.org>; Fri,  1 Sep 2023 10:30:57 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-795547f055fso1756239f.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 01 Sep 2023 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693589457; x=1694194257; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7Ic2JgCifJ9BR0gJc8OX6iWRD9HNnkepfgcfad3kDo=;
        b=SPElVj5M8FQdB+9oWJYY0ToWYq1+jmQHj7nZhPrYAZ0Qb+Dj0pVlyoIbB/eLEH3q05
         pLjOwpVIMIs1waVz1BE0xG53mKyNGnvFnxiF/lPj/JCX+iyycZUSIx8weIMFvn6pjR/S
         dD+XMlHbIbTQcY/F56x6C2ZkkhyaX1pw37f2xab2vu5zbtLUIQWCoO10XNG3LwB/+cd2
         fyfRg9kA0rCvJfqErAiT0JZdFRSfFUNVfZESSllHezxuJDgKr4UZk3XH0QnL8YsfzJq5
         UqfbxtV4b8MXQv3S2aww2p4yn/9RHTk1q+beCp2fI8KE9Ni8N26MTakzokV8ABUOhQc4
         FsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693589457; x=1694194257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7Ic2JgCifJ9BR0gJc8OX6iWRD9HNnkepfgcfad3kDo=;
        b=QfbPAFl8X011P7obB2TplstH4yWO0BxY4zyi1y2bfbnzD708vA8+P8/bldbiRSWgUh
         LpogwrJulA5oR91LmKRAalaHQxnt4mWFlMagnmVzzIgfdyHnW0ydS15JMNHyELZdw8iw
         clxq2RxcIKwYwYbE03s+axLmhDOqTjfg85LNSM2Q3+gwv15IpCCVlry+4B7dkUVbi2lH
         iuwlTXDi6tmqErDrVzKYKlVWq9IlubwDqhAJvKL+igoetqY/yG2/r+lHq8uBabGwVJ8p
         pD3vPA5pvVkkoTWf7Fs3suaT+L51Zp6yOEhcL2EDQfJGvyr6jwSgo5R0E3m/997sdGd6
         IRxg==
X-Gm-Message-State: AOJu0YxAggsiFM3S98TWA9b2e55WjozXaM3Z8C5sibxTCUp2jDRh8tQi
        8un+kztzX0MJzLtowRlExoU=
X-Google-Smtp-Source: AGHT+IG60rEwPMClyUpLxgIkdetUrkTvd12OeZpQuEmA5mPuJPh251Y1toBygAxAyHVb0OiLVFUbUA==
X-Received: by 2002:a6b:7f46:0:b0:791:2db5:c779 with SMTP id m6-20020a6b7f46000000b007912db5c779mr3826112ioq.10.1693589457075;
        Fri, 01 Sep 2023 10:30:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f23-20020a056602039700b007836252a084sm1178665iov.48.2023.09.01.10.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 10:30:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 1 Sep 2023 10:30:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>, semenzato@google.com
Subject: Re: [patch 17/17] x86/fpu: Move FPU initialization into
 arch_cpu_finalize_init()
Message-ID: <ba1b11e5-b3f0-457b-8920-d57d470626c3@roeck-us.net>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.902376621@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613224545.902376621@linutronix.de>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Wed, Jun 14, 2023 at 01:39:46AM +0200, Thomas Gleixner wrote:
> Initializing the FPU during the early boot process is a pointless
> exercise. Early boot is convoluted and fragile enough.
> 
> Nothing requires that the FPU is set up early. It has to be initialized
> before fork_init() because the task_struct size depends on the FPU register
> buffer size.
> 
> Move the initialization to arch_cpu_finalize_init() which is the perfect
> place to do so.
> 
> No functional change.
> 
> This allows to remove quite some of the custom early command line parsing,
> but that's subject to the next installment.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

The backport of this patch into chromeos-5.10 and chromeos-5.15 via stable
relase merges is causing various Chromebooks (not all of them) to crash
early during boot. Subsequent fixes have not addressed the problem for us,
so we already reverted the patch from chromeos-5.15 and will revert it
from chromeos-5.10 as well.

I don't know if this is a Chromebook specific problem, or if it affects
mainline, so this is just a heads-up in case others experience similar
problems.

Thanks,
Guenter
