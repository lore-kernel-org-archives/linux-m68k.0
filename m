Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B851C41604
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38E1F2076C
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgJGIFs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:05:48 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:43015 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgJGIFr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 04:05:47 -0400
Received: by mail-oo1-f68.google.com with SMTP id w25so388817oos.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Oct 2020 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=veShSx9NyaM6ZMMmIsmrDUqCLvApy53cWyLPd+hfj64=;
        b=uTklzSqd5OntnlTjvhwHfddrmlqgqu0hs+WEIgn/GI4qCDtk3kOXUrJVSqOb3MeXSf
         Fibuyzi1IjN2T+XQrhsvaBjUNJnSCDv+JfctXe7YO3PMW+178vbG77G9OpcrCLqNMEUh
         5olXbCwc1qCDLtVVjTR82vFatrGq697g34bFw6zGX2nh/eK7Hv86nkkkGhb1iPf8b2xH
         tDrD+1+1XOwyiuQPE7gJbjgK8ntqV1Q0FWeCZm4fNyCT0tVD6eZXGZrKqGwF/Ny/ig0o
         OKi8SNKRtX1EfqZPJlxbL4CK/mSTWZLT0/vEvrVt14o66ysjsDsnzDTom3JUQ1wFmXwo
         +6pQ==
X-Gm-Message-State: AOAM5303nYjxlmfElNngXxunZZDLWyLvjTQkGcOrnlfHgKPIhL9SlyIN
        DFHXhvpeYW/KQBFjO7ZC979lZLfFzkqYM+AiE6k=
X-Google-Smtp-Source: ABdhPJw6tQeaS54MV7wtrabdeH7AwMFF1L5NcQ211BbGEBnnUEUZ4/gBgMNObsvyTKJaG4o39A72OeKy86K8Ebh3w1s=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr1290256ooa.1.1602057947124;
 Wed, 07 Oct 2020 01:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
In-Reply-To: <20201007074447.797968-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Oct 2020 10:05:36 +0200
Message-ID: <CAMuHMdV4EQpT1iGKj6KfMueGVd13nzCXajyY_vq=Bm=rN9V9Lg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> don't bother with a compat handler for it, and remove the remaining
> definitions as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
