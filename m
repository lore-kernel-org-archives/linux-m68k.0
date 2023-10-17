Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6A7CDB483
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 10:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbjJQKo6 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 06:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQKo5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 06:44:57 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D789AA2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 03:44:55 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a82f176860so46235777b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 03:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539495; x=1698144295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPRdJ+3TN8Zmg5SzFNo5gq2GpoI/z77WwxmQGbYRfiU=;
        b=QZ/f2YXe75GhzRL0M8+RiI5niAtaEcuWkn+TQqknujWwT67uUhGKfzh846pVEEZdPf
         2iHQ/yF5WtwPGsyZ0hHt5AXpN2kwIQbbqw/suHICHu+4nj1Ei9Tkk+wLi+HwX2LZU5ti
         A9fFJz5mdxzFJOvkMM/nH2iogknmANAJ9IvqRxXxYoZvl1K0E/daOgMZYmu/YRO/rL4w
         EG7NQOJT0+WOjIbXWwbqNt/ngX7UKFmaKV5z9+3oW4PBSXZGc7c3zn40wcCG5ojQlAq1
         jDASxeq/Hwqmh8Kl7kXLnfRR/Dgv0pQWYCGRdYdZYdW0ttJnKA/O7gOKsTa1C+155EiL
         Fg1A==
X-Gm-Message-State: AOJu0YxcWFuCeeY3y8rHC0MBfSAs+/N45WHrLUlHewkjhy72CPlavudW
        lrCvu5R/Edqvp2n6T9y5WiXSxgWUvieWbQ==
X-Google-Smtp-Source: AGHT+IFKnmdg/17cJJgZIqEbw4EYI2/a4I6aYdiy20qs2/wjCb0iTO+0SBP+i34L75wpcmhJI842TA==
X-Received: by 2002:a81:91d5:0:b0:58e:fa3c:9401 with SMTP id i204-20020a8191d5000000b0058efa3c9401mr1976679ywg.12.1697539494690;
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id g2-20020a815202000000b005a50575b1c8sm501699ywb.26.2023.10.17.03.44.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7ac4c3666so67827097b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id
 w144-20020a814996000000b005920ffcc787mr1937845ywa.30.1697539494112; Tue, 17
 Oct 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
In-Reply-To: <20231016131745.GB26484@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 12:44:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To:     Christoph Hellwig <hch@lst.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Oct 16, 2023 at 3:17 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > +   select RISCV_DMA_NONCOHERENT
> > >     select ERRATA_ANDES if RISCV_SBI
> > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> >
> > Since this Kconfig menu has changed a bit in linux-next, the selects
> > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > RISCV_DMA_NONCOHERENT.
>
> Oh, looks like another patch landed there in linux-next.  I had
> waited for the previous one go go upstream in -rc6.  Not sure
> how to best handle this conflict.

I think the easiest is to ask soc to apply this series?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
