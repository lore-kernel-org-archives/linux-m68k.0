Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74364C61DA4
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Feb 2023 09:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjBNJA4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Feb 2023 04:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjBNJAz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Feb 2023 04:00:55 -0500
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D025B30C1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:00:52 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id b3so22548652lfv.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mNyenBvavxUdV7/ZOu+dVcpWueC+FqvBBNVPDVl8j0=;
        b=O4cUKNbpGxcLw/nqIBCUYjTjZYvj25iFxAsJ7BRhJ2+7qy48dji7lrjANP3iEbGUu5
         PYhMGuyG1+LmcjScDGHrxy1JWR4JP73oYtOXpfo1ypCzBKIVBBmb6xq6fbCZ5wAqmmbh
         s0GO+MEVbU7b9lQT16CYKWdZlTuZtcoN9FJiuW58WeImpKhxrFONUcIQEvJeTG6c2YJQ
         iUDZYXB/QU2qBNM3qOgl2i1Yl8zxSU18xsWuxqrw9eAkoHo6P4VjljrEaXjyjlRo2rFO
         FX80Utcorhfri375SJP3Myvu1fe6uCZxUfgj/iCI5KlO19bVVksyp2jpdIem5g3Edb7N
         cjig==
X-Gm-Message-State: AO0yUKXSWTCcY3rPWnBquYffVAGUTeSeYbmJg4ydEvYwQ3gOFAaHzIgM
        4fH3AHmbGsEz9jMRNr70wIcCpe514yIFCp1c
X-Google-Smtp-Source: AK7set9UM2MtEdG2NTyJ6qftRl0tJM8GYtRuOuqw8wKB1MHSrbK/pw4IHy9q0TMhJ/Ugt52g8Bcs2A==
X-Received: by 2002:a19:700c:0:b0:4d8:612d:ca03 with SMTP id h12-20020a19700c000000b004d8612dca03mr528247lfc.16.1676365250362;
        Tue, 14 Feb 2023 01:00:50 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id r26-20020ac252ba000000b004db1afe388asm1045347lfm.163.2023.02.14.01.00.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:00:46 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id l3so17625403ljo.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:00:46 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149587ljh.37.1676365235984; Tue, 14 Feb
 2023 01:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-6-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-6-alexghiti@rivosinc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 10:00:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Subject: Re: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 14, 2023 at 8:55 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
