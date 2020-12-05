Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D90C4361A
	for <linux-m68k@archiver.kernel.org>; Sat,  5 Dec 2020 12:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEC222DFA
	for <linux-m68k@archiver.kernel.org>; Sat,  5 Dec 2020 12:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgLEMiN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 5 Dec 2020 07:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbgLEKxu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 5 Dec 2020 05:53:50 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDC4C0613D1
        for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Dec 2020 02:53:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cp5yS3QDtz9sWP;
        Sat,  5 Dec 2020 21:53:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1607165585;
        bh=ex3cBBYGGN8ZWn9vGp/TzfU5wQ1yOIKrp67fUHz4AE4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MfCwRUADxMG/+vtCEkz7YojkhXgIWk8lfh8CPgQGdhPqABpzV+bALLpbltLVK9zVn
         PAcfQXIRg2BRFE2XSGuodSDZt/FH5P9ub/IwRC4EYKEr31GPME67ziBri3NKo30/Ig
         0TAdbS1seFMo0HK2sdMRpMniXhCUzMwflYR0m9DwtGZmIULqGo2mnry0eHs7TWMWI4
         or7Z/vIneEsndJtKiBbtEqU9/4pkNSkBZvKzg7suW/GJG8NDSaqlZQVMyVGuc+Q8hU
         1b6DJNd1P+cpKAxdtW+epAzc8nVPdFUfqvYpJw7Z8r25lWjWQACM4i/CBenxI/CDOV
         1mfYiUF0UGpXg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Finn Thain <fthain@telegraphics.com.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joshua Thompson <funaho@jurai.org>,
        linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update 68k Mac entry
In-Reply-To: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
References: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
Date:   Sat, 05 Dec 2020 21:53:03 +1100
Message-ID: <871rg4v81c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Finn Thain <fthain@telegraphics.com.au> writes:
> Two files under drivers/macintosh are actually m68k-only. I think that
> patches for these files should be reviewed in the appropriate forum and
> merged via the appropriate tree, rather than falling to the powerpc
> maintainers to deal with. Update the "M68K ON APPLE MACINTOSH" section
> accordingly.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 867157311dc8..e8fa0c9645d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10322,6 +10322,8 @@ L:	linux-m68k@lists.linux-m68k.org
>  S:	Maintained
>  W:	http://www.mac.linux-m68k.org/
>  F:	arch/m68k/mac/
> +F:	drivers/macintosh/adb-iop.c
> +F:	drivers/macintosh/via-macii.c
>  
>  M68K ON HP9000/300
>  M:	Philip Blundell <philb@gnu.org>
> -- 
> 2.26.2
