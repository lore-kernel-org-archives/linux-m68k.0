Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF17C6FD1D
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Mar 2023 12:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjCNM4E convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Mar 2023 08:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbjCNMz3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Mar 2023 08:55:29 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504E0A674E
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 05:51:00 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id h11so3288391ild.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBpmO88aubLNx5ds9k4LYpaw6LJjHZV6232nWb27C40=;
        b=S7u+Bsv4wT6CdvsgbC8pq5J6ozvXyUScn2rY0Gid7zypjRhImb21wRMn+BLgf8w7w1
         S/SNPMlC9d9bEJJM+JOxkRzgx63CqG9HVWT2cDeL3E+r3xW189Q08eYT9TKY22aA+snT
         j+zUbpEICM6n+IqY35yKia7N7tDwyGHLwXoTgoXqTaOOMpRN3sl3gRSrpfkW3sf1xtDL
         QYc9JKI8vb1qT8ENijv0rKPmWfPrdV0BrQulRAGqxrwegWDfs3lfEFLNvDkEcmpzVFnW
         AyX2kNwcaMG01ROBpe/ynmOnfUwKGpLGE6xfL5TA4cUx1kTe0+GQZNdixqh/X4Xt0UcG
         +97A==
X-Gm-Message-State: AO0yUKUGdujmfoWpugRCMp2CqZzry/glM57zIIn3zpzjsNasVxzxyJrl
        W9ZzeN8D5/n+U0slBwTc5HInK/SrcORhAw==
X-Google-Smtp-Source: AK7set+8OmH7IWg1s+yjJ6Tngw4K+8YAH3gy/31CVSSWhGZDa9thQ+bUPCu8tzVCx7Fbul1Weq26qw==
X-Received: by 2002:a05:6e02:1ca8:b0:322:fe79:8141 with SMTP id x8-20020a056e021ca800b00322fe798141mr2895096ill.1.1678798136258;
        Tue, 14 Mar 2023 05:48:56 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id k2-20020a056e02134200b0030ef8f16056sm765760ilr.72.2023.03.14.05.48.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 05:48:55 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id d12so6332375ioe.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 05:48:55 -0700 (PDT)
X-Received: by 2002:a05:6902:1002:b0:b48:1359:4e28 with SMTP id
 w2-20020a056902100200b00b4813594e28mr461087ybt.12.1678798114483; Tue, 14 Mar
 2023 05:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230314121216.413434-1-schnelle@linux.ibm.com> <20230314121216.413434-2-schnelle@linux.ibm.com>
In-Reply-To: <20230314121216.413434-2-schnelle@linux.ibm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Mar 2023 13:48:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9ZoB5XNiiVEG-zBzB9eN5RJSC42WMDD-RZfcg=2tr4g@mail.gmail.com>
Message-ID: <CAMuHMdV9ZoB5XNiiVEG-zBzB9eN5RJSC42WMDD-RZfcg=2tr4g@mail.gmail.com>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
To:     Niklas Schnelle <schnelle@linux.ibm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 14, 2023 at 1:13 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
> Port access. In a future patch HAS_IOPORT=n will disable compilation of
> the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces such as s390. Also
> add dependencies on HAS_IOPORT for the ISA and HAVE_EISA config options
> as these busses always go along with HAS_IOPORT.
>
> The "depends on" relations on HAS_IOPORT in drivers as well as ifdefs
> for HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

>  arch/m68k/Kconfig       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
