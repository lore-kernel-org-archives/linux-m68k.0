Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B0AC4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Nov 2022 15:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242111AbiKRPYe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbiKRPYd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Nov 2022 10:24:33 -0500
X-Greylist: delayed 488 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Nov 2022 07:24:33 PST
Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1016B61B8A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Nov 2022 07:24:32 -0800 (PST)
Received: from momiji.horms.nl (86-93-216-223.fixed.kpn.net [86.93.216.223])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by zeeaster.vergenet.net (Postfix) with ESMTPSA id A5E022000E;
        Fri, 18 Nov 2022 15:15:52 +0000 (UTC)
Received: by momiji.horms.nl (Postfix, from userid 7100)
        id 4DC049402B6; Fri, 18 Nov 2022 16:15:52 +0100 (CET)
Date:   Fri, 18 Nov 2022 16:15:52 +0100
From:   Simon Horman <horms@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     horms@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org
Subject: Re: [PATCH kexec-tools v3] m68k: pass rng seed via BI_RNG_SEED
Message-ID: <Y3ehqF20MWK1B+gO@vergenet.net>
References: <CAHmME9oMiDixKuC==sEHk3O5vfEV_67ouLjtUYQOnfSp9decxA@mail.gmail.com>
 <20221114154303.1176987-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114154303.1176987-1-Jason@zx2c4.com>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.7 at zeeaster
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Nov 14, 2022 at 04:43:03PM +0100, Jason A. Donenfeld wrote:
> In order to pass fresh entropy to kexec'd kernels, use BI_RNG_SEED
> for passing a seed, with the same semantics that kexec-tools currently
> uses for i386's setup_data.
> 
> Link: https://git.kernel.org/torvalds/c/dc63a086daee92c63e3
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks Jason,

applied.
