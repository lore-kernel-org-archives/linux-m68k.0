Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C89AECAAD8
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 16:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiIWQjN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 12:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbiIWQi4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 12:38:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E2140578
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 09:37:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2558361908
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 16:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827B2C433B5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 16:37:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jUpCTdkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663951072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5wP8/olBSLeZ3q606VAu09uERiOChlp35MnSGyQzTko=;
        b=jUpCTdkn6lFuOUG4Xm5w7INmLzpwBjSVWKcOMBM2J1C+WgQHx9mDCjm+5AeA0QRtdYi5o7
        bf9Gp7FRWMuYrtydUPWMOY/KCrBxX5tv6qub8aINXYelBvjvGs3cKlNah8k6y/RFoVHFvM
        RXiRlCRAMznIjovNbffQmFkNX6FXoOc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 94b5298e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Fri, 23 Sep 2022 16:37:51 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id 63so526097vse.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 09:37:51 -0700 (PDT)
X-Gm-Message-State: ACrzQf0jxrlzJcGhAzGnPG+IxQ4irBJeQyiRa9xrpqeTsgdN5EirWz5W
        uu3Yz//YrZ0RpKHZJlloDF+BQndejK3aUd+9O40=
X-Google-Smtp-Source: AMsMyM7eN2EDq1uQGB8dxgn+o1qMJqL3vgUJ+mhmpsliSYOasMapWuSBuPqh+9pW5XD74Nw7X3FXTP0jwu9GuyopkgE=
X-Received: by 2002:a67:c289:0:b0:398:cdc:c3ef with SMTP id
 k9-20020a67c289000000b003980cdcc3efmr4185299vsj.76.1663951070524; Fri, 23 Sep
 2022 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220923124642.3942806-1-Jason@zx2c4.com> <CAMuHMdU-KyOXg_nEa=gur-X5vjBimOM+zZ-g-xqYhAV-wBOfSA@mail.gmail.com>
In-Reply-To: <CAMuHMdU-KyOXg_nEa=gur-X5vjBimOM+zZ-g-xqYhAV-wBOfSA@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 23 Sep 2022 18:37:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9ow+ivvQaCnPqRNiYRn4+fuGksKyRAEWtBa-6yhyg9OTA@mail.gmail.com>
Message-ID: <CAHmME9ow+ivvQaCnPqRNiYRn4+fuGksKyRAEWtBa-6yhyg9OTA@mail.gmail.com>
Subject: Re: [PATCH kexec-tools] m68k: pass rng seed via BI_VIRT_RNG_SEED
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On Fri, Sep 23, 2022 at 3:07 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> This won't work as expected: BI_VIRT_* tags are only valid if the
> machine type is MACH_VIRT.
> Worse, this will trigger for other platform-specific tags using the same value:
> Likewise, this will destroy existing BI_AMIGA_CHIPSET and BI_MAC_SCCBASE
> tags, breaking Amiga and Mac.
> As random seeds can now be generic, I think it makes sense to introduce
> a machine-independent BI_RND_SEED.
> In hindsight, we should have done this from the beginning...

Yes, I agree. I thought that would be rejected, though, which is why I
didn't do that before. I'll send a patch switching over to that.
There's no point in keeping the old one around, I don't think, so I'll
just move everything over to the new.

Jason
