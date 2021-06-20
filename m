Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2D3C48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 08:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4037B6100A
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 08:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhFTIc7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Jun 2021 04:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhFTIc7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Jun 2021 04:32:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF48C061574
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 01:30:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id nd37so23314062ejc.3
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kazik.de; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DojqSxCC80oiW5B/wzCpI09x/w14/X8vv7tL8vCBtgk=;
        b=l9YETLXeRHFKQK1QhG3MQtVoq0G/BBzQZw07BVMWYSGmlQSn1OSaFpcaMdJU4Asv4K
         YldeO09aJFS4oPbNEB9Z86WlFUdTpSPqjHzi4t2EnHbBUxsI0VtEHiZ/I1l6MeOHH96y
         vGj3emVo2Z/99ITbk0cepyi+QiPSk7+hiL5uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DojqSxCC80oiW5B/wzCpI09x/w14/X8vv7tL8vCBtgk=;
        b=JgqGw/eXQkJos488Ygzg9Cbe4PIOZhHB41Hn3vsIb8n96NQqZwxx/cw+MSj5YqgBYb
         Jp0eMwjgLOsp9RPrUUlzx276hc8fuprvsMEuIVrMWWkT5lpEpr6d9MSacDBtJFpJocEx
         ZNxqIizCYPbON0UL2FEl+pHO0PI3tQB6he2cgqbBi7E5jZKroWhgsbCFNEyxlqblwJqj
         3aaZ9zrhIuFY2KaVRr8WeBFBP/nowfOYCaMeO05eFahx889EHM6XIeGVf/ioIeOKmKRi
         oKygRBMHvYdu6Os17H5AAS7maBPQIch8MpFAF14mgEqfZUb7yqjW/VOP6SdZ7nTJeqkp
         1+xw==
X-Gm-Message-State: AOAM531KTiUosQ7TLp8PoZJ1TxZ9w9LWJX1uUO0jYlck4ZiZO46HLE2O
        ivoF3llJ+BgucqtwZ1363b/1p8VmZzCtjZ2UOB9c7A==
X-Google-Smtp-Source: ABdhPJw5akvGTueD37Xw2f1buofX6Y79lIy2Cfj88lnT3gKWcrBSbNnbXaFYtCh4D7laFdANgrOU8ol0AnJnRdH8f2g=
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr19154142ejc.389.1624177844099;
 Sun, 20 Jun 2021 01:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
From:   ALeX Kazik <alex@kazik.de>
Date:   Sun, 20 Jun 2021 10:30:33 +0200
Message-ID: <CAFFuhJry5tuJmzu1H_3-9NfGsiOYGHQpdY7aPBOockXeA7NAhw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add APNE PCMCIA 100 Mbit support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

I've tested the v6 patch on my A1200 and it works great.
It's activated via the kernel boot option "apne.100_mbit=1".

Alex.
