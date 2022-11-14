Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD4CC43219
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Nov 2022 15:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237063AbiKNPjm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Nov 2022 10:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237133AbiKNPjZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Nov 2022 10:39:25 -0500
X-Greylist: delayed 405 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Nov 2022 07:39:16 PST
Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FC92E9F0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 07:39:16 -0800 (PST)
Received: from madeliefje.horms.nl (2a02-a44a-2918-403-201-8eff-fe22-8fea.fixed6.kpn.net [IPv6:2a02:a44a:2918:403:201:8eff:fe22:8fea])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by zeeaster.vergenet.net (Postfix) with ESMTPSA id 409982000E;
        Mon, 14 Nov 2022 15:32:00 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
        id 0206E472B; Mon, 14 Nov 2022 10:31:59 -0500 (EST)
Date:   Mon, 14 Nov 2022 16:31:59 +0100
From:   Simon Horman <horms@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org
Subject: Re: [PATCH v2 RESEND kexec-tools] m68k: pass rng seed via BI_RNG_SEED
Message-ID: <Y3Jfb5fUnX3skm3+@vergenet.net>
References: <20221111013532.494463-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111013532.494463-1-Jason@zx2c4.com>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.7 at zeeaster
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 11, 2022 at 02:35:33AM +0100, Jason A. Donenfeld wrote:
> In order to pass fresh entropy to kexec'd kernels, use BI_RNG_SEED
> for passing a seed, with the same semantics that kexec-tools currently
> uses for i386's setup_data.
> 
> Link: https://git.kernel.org/torvalds/c/dc63a086daee92c63e3
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Seems like this was forgotten about, so resending.

Hi Jason,

Sorry about missing this earlier.

I was planning to apply it just now, but it seems that
the github workflow flagged a problem:

In file included from ../../kexec/arch/m68k/kexec-m68k.c:19:
../../kexec/arch/m68k/bootinfo.h:25:4: error: unknown type name ‘u8’
   25 |    u8 data[0];
      |    ^~
make[1]: *** [Makefile:124: kexec/arch/m68k/kexec-m68k.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from ../../kexec/arch/m68k/kexec-elf-m68k.c:27:
../../kexec/arch/m68k/bootinfo.h:25:4: error: unknown type name ‘u8’
   25 |    u8 data[0];
      |    ^~
make[1]: *** [Makefile:124: kexec/arch/m68k/kexec-elf-m68k.o] Error 1
make: *** [Makefile:276: distcheck] Error 2
make[1]: Leaving directory '/home/runner/work/kexec-tools/kexec-tools/kexec-tools-2.0.25.git/_build/sub'
Error: Process completed with exit code 2.

Ref: https://github.com/horms/kexec-tools/actions/runs/3462830642/jobs/5782238446
