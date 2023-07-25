Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365B6C00528
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 07:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbjGYHRr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjGYHRQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 03:17:16 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FEF1FFC
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:16:52 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4046cdbff16so38322611cf.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690269411; x=1690874211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJjDsseCku7rw4c3XWBJPjjfZ2OLqB4Q28CEWAPlCas=;
        b=OwjLCjwOyt4VaXEZsJKUQRF+i6wY5Ipm4NvqnjHeh16pRhu2aU8GhybSzwstAwuMh7
         L6WbQwfdPYnyw6RW4pUJaRW4lrxTEjrscYW3T/3NTtUFXM8cDVr7ouwoKcrWhSdykxpa
         qUVFoIJaGw4G0c9coVfOg9yr6PzWie4FEapgJwH7HoBKikoP+7cYNaUijmBDFdN7381P
         wKqpEZS/y/MgdRSvpylckey0HxORm47R1k/RIFnMEnmLV9ADXPE8+C6Aa0JSmVMxdHqn
         DfePIjLUlieSoGEF+hK3GSsne7Q+jqMRrE593If37p1izbkB+xOJm9e5gDw4cFHGwyPK
         rtlg==
X-Gm-Message-State: ABy/qLYsHC10NkhlG82cmvPX0fPRRn0ir2cCKRy67Hz9gjiidRAcc75H
        Nnz0D9eYkJdVlGa2xbgtbbmd+8h/vnSdRvc/
X-Google-Smtp-Source: APBJJlE4LRFOg3fgMxyc4uE0D8298Ip/UFRFGXtR9bsvZtCqgj+Xt0ULIOz4XL1jL05T3RttqurIMw==
X-Received: by 2002:ac8:5882:0:b0:403:a808:2f50 with SMTP id t2-20020ac85882000000b00403a8082f50mr2056999qta.31.1690269411217;
        Tue, 25 Jul 2023 00:16:51 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id b20-20020ac85414000000b0040541a8bd66sm3843770qtq.60.2023.07.25.00.16.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:16:49 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4046cdbff16so38322311cf.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:16:49 -0700 (PDT)
X-Received: by 2002:a25:10c5:0:b0:c91:717e:7658 with SMTP id
 188-20020a2510c5000000b00c91717e7658mr10654915ybq.2.1690269388936; Tue, 25
 Jul 2023 00:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
In-Reply-To: <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jul 2023 09:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzYxo83AXfWWVyp2fL3fcEUNgbG5aSZuA62FwO2i3jDg@mail.gmail.com>
Message-ID: <CAMuHMdXzYxo83AXfWWVyp2fL3fcEUNgbG5aSZuA62FwO2i3jDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
To:     Alexey Gladkov <legion@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        viro@zeniv.linux.org.uk, Palmer Dabbelt <palmer@sifive.com>,
        James.Bottomley@hansenpartnership.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, axboe@kernel.dk,
        benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de,
        catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org,
        davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de,
        dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com,
        glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com,
        hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org,
        kim.phillips@arm.com, ldv@altlinux.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org,
        luto@kernel.org, mattst88@gmail.com, mingo@redhat.com,
        monstr@monstr.eu, mpe@ellerman.id.au, namhyung@kernel.org,
        paulus@samba.org, peterz@infradead.org, ralf@linux-mips.org,
        sparclinux@vger.kernel.org, stefan@agner.ch, tglx@linutronix.de,
        tony.luck@intel.com, tycho@tycho.ws, will@kernel.org,
        x86@kernel.org, ysato@users.sourceforge.jp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 11, 2023 at 6:25 PM Alexey Gladkov <legion@kernel.org> wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
