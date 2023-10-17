Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D996CDB474
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 13:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbjJQNMj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 09:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233940AbjJQNMi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 09:12:38 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F512F1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 06:12:37 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7dafb659cso68949457b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 06:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548356; x=1698153156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrjVOTU4vVWhg8rZEFBUd1El+uZlCjcijcwvkBEbBus=;
        b=lJ2c+I94D7mwQnxtx3kUxeIVzzLrnwoPsBSkhx7+RTvIpyyLfJQPi4mNmLyVRVMUTK
         55NB90tEiOZAON6Ckcvtj1yS4vPevlngeW+4ABLOTMmFecrQ/DAWZSg0zhPfs3jDNvpQ
         495EjxKge9ehFpC2h73PvYdCxWcwWhkLiTkQIFQaW4O+oBU3kZlVFitVQGqosGoeQ8SK
         ExfvBg2vn6rpDI1v7KemN3B+jC6w9h/Pq3h5hibnFoK1LHTJJyu1C2ssxO8q2P++6xBt
         C4i3KMWvvCyrs1FAv+8RZNGsrQAJUA3rdZfJbvwi7jaxaMYUy3L6TqF6aND+nS21VbGu
         6FOw==
X-Gm-Message-State: AOJu0YxuB4K1dJWqaWpbUNMXDctQ540B8cSEmZ48BHKN4Z7xqde8hofM
        A8ZCZAIFSFCMATJdGrFcDenFEHGAkjGjkw==
X-Google-Smtp-Source: AGHT+IG9xzHoTAV58mj2fGpcuJR8JUKFax2TuFMqSN97STbFJTVhUzEghXOqhe2+7MDhErNzilzmag==
X-Received: by 2002:a81:80c7:0:b0:59b:c0d7:6766 with SMTP id q190-20020a8180c7000000b0059bc0d76766mr2065204ywf.37.1697548356374;
        Tue, 17 Oct 2023 06:12:36 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id g1-20020a81fd01000000b005463e45458bsm589767ywn.123.2023.10.17.06.12.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:12:35 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7c08b7744so68409767b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 06:12:35 -0700 (PDT)
X-Received: by 2002:a0d:cb10:0:b0:5a7:afcc:80fe with SMTP id
 n16-20020a0dcb10000000b005a7afcc80femr2307771ywd.3.1697548354803; Tue, 17 Oct
 2023 06:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
 <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com> <20231017124608.GA4386@lst.de>
In-Reply-To: <20231017124608.GA4386@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
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

On Tue, Oct 17, 2023 at 2:46 PM Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Oct 17, 2023 at 12:44:41PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Oct 16, 2023 at 3:17 PM Christoph Hellwig <hch@lst.de> wrote:
> > > On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > > > +   select RISCV_DMA_NONCOHERENT
> > > > >     select ERRATA_ANDES if RISCV_SBI
> > > > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> > > >
> > > > Since this Kconfig menu has changed a bit in linux-next, the selects
> > > > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > > > RISCV_DMA_NONCOHERENT.
> > >
> > > Oh, looks like another patch landed there in linux-next.  I had
> > > waited for the previous one go go upstream in -rc6.  Not sure
> > > how to best handle this conflict.
> >
> > I think the easiest is to ask soc to apply this series?
>
> I don't think pulling all the DMA bits into a random other tree
> would be a good idea.   I can hand off the first few bits, but I'd
> need a stable branch to pull in after that.  Which of the half a dozen
> soc trees we have in linux-next is this anyway?

The one and only https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
