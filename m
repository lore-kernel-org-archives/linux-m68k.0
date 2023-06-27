Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5E3EB64D9
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 16:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjF0QxA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Jun 2023 12:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbjF0Qw5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Jun 2023 12:52:57 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B657113
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 09:52:56 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-765a7768f1dso227611685a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 09:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687884775; x=1690476775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lIZI96K9vdLoSwUwpQZZH+ZWrx3VsFWqYpi3+69yqU=;
        b=k7woLQe+4aDsRPaU3uOjRhNgYlLnyedONDLrt1g0w/CqZ0g6cnaeN/P4Ss8BUn2m8s
         svdBXvsmuQpb7TOolBysxpQPjN/TckWZi9hTHB4b+rLNrN+RkA0cPZh2WWam6VLJpJyp
         nfN32jtDCsaAWN5lPn3Pbz9syayIF59lNi7RuD8kebyWRCbX/GkHASCtBb8f/W590NVX
         rCGicvZUZYyjiPnSxERXgr6XgKLdBKlsQW9/Wqy1pQI5bTOzjtQ6hrUi3PQoaTHJDnVt
         VjY0pPuEQ6SSz98cMJj9Uak+kiMCJ/D9XKClnVpjXYc+IiF2Q2CCqi0cC3HDlsZm9qw9
         4ihw==
X-Gm-Message-State: AC+VfDzEbZBxlQDTgPiDqkCHRwwy8zRMyfhm/ga4FJJ64KYUFJVDBoFf
        tIULqw6k5KisxavKqtLWQ1EoJTNmwvB/6m4C
X-Google-Smtp-Source: ACHHUZ7Ta58CvB+t1lJAPkh4D1RuiSCcVQjzsYzDleomCaUkbkWjBEKqQbHCxgtmBB4+rAgD6HMN3g==
X-Received: by 2002:a05:6214:29e6:b0:630:6926:d00e with SMTP id jv6-20020a05621429e600b006306926d00emr32952776qvb.39.1687884775139;
        Tue, 27 Jun 2023 09:52:55 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id fb9-20020ad44f09000000b0062b76c29978sm4744535qvb.6.2023.06.27.09.52.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4009130358cso44525611cf.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6358:f55:b0:132:d3b1:c34a with SMTP id
 c21-20020a0563580f5500b00132d3b1c34amr12105551rwj.7.1687884753801; Tue, 27
 Jun 2023 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
 <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
In-Reply-To: <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Jun 2023 18:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Conor.Dooley" <conor.dooley@microchip.com>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 13, 2023 at 2:52 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Apr 13, 2023, at 14:13, Biju Das wrote:
> > FYI, this patch breaks on RZ/G2L SMARC EVK board and Arnd will send V2
> > for fixing this issue.
> >
> > [10:53] <biju> [    3.384408] Unable to handle kernel paging request at
> > virtual address 000000004afb0080
>
> Right, sorry about this, I accidentally removed the 'phys_to_virt()'
> conversion on arm64.

Meh, I missed that, so I ended up bisecting this same failure...

This patch is now commit 801f1883c4bb70cc ("dma-mapping: replace
custom code with generic implementation") in esmil/jh7100-dmapool,
and broke booting on R-Car Gen3.

The following gmail-whitespace-damaged patch fixes that:

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 97b7cea5eb23aedd..77e0b68b43e5849a 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -15,17 +15,23 @@

 static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-       dcache_clean_poc(paddr, paddr + size);
+       unsigned long start = (unsigned long)phys_to_virt(paddr);
+
+       dcache_clean_poc(start, start + size);
 }

 static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-       dcache_inval_poc(paddr, paddr + size);
+       unsigned long start = (unsigned long)phys_to_virt(paddr);
+
+       dcache_inval_poc(start, start + size);
 }

 static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-       dcache_clean_inval_poc(paddr, paddr + size);
+       unsigned long start = (unsigned long)phys_to_virt(paddr);
+
+       dcache_clean_inval_poc(start, start + size);
 }

 static inline bool arch_sync_dma_clean_before_fromdevice(void)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
