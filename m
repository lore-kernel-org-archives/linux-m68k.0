Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAC8C04A95
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Sep 2022 23:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbiI1XQh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbiI1XQ3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Sep 2022 19:16:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522E9A7AA1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 16:16:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B30CA60EE7;
        Wed, 28 Sep 2022 23:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87663C433C1;
        Wed, 28 Sep 2022 23:16:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YgWBvx2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664406981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MFlE0ld6cGlbqEZR2H/NeL8tv8fttMveIrKcEOGDIZQ=;
        b=YgWBvx2lmOpqhou91IO07CApy6xxa4HTExwIYMDqcp73/boK3K1nragJmDzr6iQmVZQF5n
        b47J4/pQOcwzoESMt5+7YPwtBFzcPBdmwG6cw2xPik7rbBnjGYWSJTcqSUUiZzPozLUG4/
        RqDvZdvjvVgHULonVcjoruOfyJLYNhA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 11fdc80f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 28 Sep 2022 23:16:21 +0000 (UTC)
Date:   Thu, 29 Sep 2022 01:16:19 +0200
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Vivier <Laurent@vivier.eu>
Subject: Re: [PATCH v2] m68k: pass rng seed via BI_RNG_SEED
Message-ID: <YzTVwzc3oxdWgHjt@zx2c4.com>
References: <CAHmME9ow+ivvQaCnPqRNiYRn4+fuGksKyRAEWtBa-6yhyg9OTA@mail.gmail.com>
 <20220923164152.4079868-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220923164152.4079868-1-Jason@zx2c4.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Sep 23, 2022 at 06:41:52PM +0200, Jason A. Donenfeld wrote:
> In order to pass fresh entropy to kexec'd kernels, use BI_RNG_SEED
> for passing a seed, with the same semantics that kexec-tools currently
> uses for i386's setup_data.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Geert - this hasn't been compile tested yet and also depends on changes
> that haven't yet landed upstream. Posting this preliminarily now. -Jason

With [1] having landed, does this patch here suffice for kexec-tools?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?id=f1bb20c8be1929743fdb313b4770601afc39c1b7

Jason
