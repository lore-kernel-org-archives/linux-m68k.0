Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDBBC433E1
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E613E20679
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="jS/kIlqm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgFOJKg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 05:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729088AbgFOJK2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 05:10:28 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8A8C061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:10:28 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id m25so8926376vsp.8
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YoMXj6XSPGol9qM1ASvm3tqpDkObKHLDnmjErvNvk8Y=;
        b=jS/kIlqmsYukUmKPpeoUPdVujwOv1oLZ3e/eaqb27alVqskYafArG0zW8TT6x8MNpo
         LMx8FAANVTD6h8SqiIRIcPvKydg1X5bPvcDrqXUEUl8y8sop3apyG2cj7+ZdqWrRNo17
         o+3RUfAsxBqpinraV26CZgFvIxqrMl5G4ZE+MoLKuo+tbMVcI5GVHq+tlqH2+/zLeImN
         aNoyL5/ubyfqVfzHavlc9HO0A7PB9CR21DuzxnejHr1LhsOb+wW1OBbo4tZIKpXwY90K
         NNWEjg0flUR3Qypeu52b/PAe0WbXfUSf8i0yOI28m8YeDdKzTXBaegFwmNXPcLaxqG53
         GJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YoMXj6XSPGol9qM1ASvm3tqpDkObKHLDnmjErvNvk8Y=;
        b=G3MoDPXXFtWTFlGmyJO/auNlOcotmlBRVCQcHOoo8ob2fAQaZe+IM6hoVQ8mP74IpK
         UDCIcWuwIzIEy/xj3KzvrUN8d/1Iag8DZingo9leHbZkihte2WKCLWlkP8nQ9eyRuwNn
         1Ur8oNZDaiTl+MCXz7fkEnhll7oi+iktD2XDP8onQ8N6Qj6cfYMUi9SjeF/ywcmrqdWb
         JRiXabQrYj2bv0txP9ssfa9oV8J7u1oti3/pYrqxrd8Rr0/+4ijvdAwcL3OxeskkYVhm
         3Ms00h0NbQMM+u4B+L+XZlp5yXoQ/9Mn70t7GMuvN6wd9J0rDiGV9ByselA4gSY9WoVH
         YjFw==
X-Gm-Message-State: AOAM532DUeowcKB4t+/T7nIMZGlI6uHbJl+UFqaxOPKHHHGdZTH1RsnM
        HmrFnI5R+hUJpaEUOgTaQq/CG3H8+fwczbaGuBPIFA==
X-Google-Smtp-Source: ABdhPJzHb3yMa9k4/LKGbGnJfBMKzlC+bx6Hv62/BPFjBga2XUWMSBOohffnOp8ObOhfbJkKOLeJDqXwqhOQ+bVMXQE=
X-Received: by 2002:a67:e957:: with SMTP id p23mr19471896vso.190.1592212227377;
 Mon, 15 Jun 2020 02:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200614225119.777702-1-angelo.dureghello@timesys.com> <20200615062613.GA7811@linux.ibm.com>
In-Reply-To: <20200615062613.GA7811@linux.ibm.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 15 Jun 2020 11:16:28 +0200
Message-ID: <CALJHbkA=T0z2-jfHr5QWnH6NCZ3ha9b0wxkxgDU5g8LK_tcVtA@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: fix node memblock init
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On Mon, Jun 15, 2020 at 8:26 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Ho Angelo,
>
> On Mon, Jun 15, 2020 at 12:51:19AM +0200, Angelo Dureghello wrote:
> > After pulling 5.7.0 (linux-next merge), mcf5441x mmu boot was
> > hanging silently.
> >
> > memblock_add() seems not appropriate, since using MAX_NUMNODES
> > as node id, while memblock_add_node() sets up memory for node id 0.
> >
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>
> The fix is correct, but it is not complete as nommu should be also
> fixed.
> I've updated your patch with nommu fix [1].
>
> [1] https://lore.kernel.org/lkml/20200615062234.GA7882@kernel.org
>

Thanks a lot !
Will try the no-mmu fix also in short.


> > ---
> >  arch/m68k/mm/mcfmmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> > index 29f47923aa46..7d04210d34f0 100644
> > --- a/arch/m68k/mm/mcfmmu.c
> > +++ b/arch/m68k/mm/mcfmmu.c
> > @@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
> >       m68k_memory[0].addr = _rambase;
> >       m68k_memory[0].size = _ramend - _rambase;
> >
> > -     memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
> > +     memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
> >
> >       /* compute total pages in system */
> >       num_pages = PFN_DOWN(_ramend - _rambase);
> > --
> > 2.26.2
> >
>
> --
> Sincerely yours,
> Mike.

Regards,
angelo
