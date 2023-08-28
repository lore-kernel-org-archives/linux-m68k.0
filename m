Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF904C83F15
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjH1N1Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 09:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbjH1N1E (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 09:27:04 -0400
X-Greylist: delayed 586 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Aug 2023 06:26:59 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56AFA7
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 06:26:59 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4RZB125sQ5z1r1s0;
        Mon, 28 Aug 2023 15:17:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4RZB123qWxz1qqlS;
        Mon, 28 Aug 2023 15:17:10 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id e04pkkmUu6So; Mon, 28 Aug 2023 15:17:09 +0200 (CEST)
X-Auth-Info: RoTQblm1Uv3VHkKRej0V0xyJj/795DioPthrVKodgl185jpgR2kFOm693RaKRSmv
Received: from hawking (unknown [81.95.8.245])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 28 Aug 2023 15:17:09 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
        (John Paul Adrian Glaubitz's message of "Mon, 28 Aug 2023 14:50:52
        +0200")
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
        <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
        <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
        <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
        <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
        <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
X-Yow:  ONE:  I will donate my entire ``BABY HUEY'' comic book collection
 to the downtown PLASMA CENTER..
 TWO:  I won't START a BAND called ``KHADAFY & THE HIT SQUAD''..
 THREE:  I won't ever TUMBLE DRY my FOX TERRIER again!!
Date:   Mon, 28 Aug 2023 15:17:08 +0200
Message-ID: <mvmy1hv71d7.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Aug 28 2023, John Paul Adrian Glaubitz wrote:

> The FP failures are most likely the result of the limitations of the FPU emulation
> in QEMU for m68k. ARAnyM is known to have much better FPU emulation support than
> QEMU, so if you want to have more accurate results, you should test on ARAnyM.

No, you should test on real hardware.  Neither ARAnyM nor QEMU comes
close.

> After all, we had to change the ABI for TLS support as well, didn't
> we?

Nope.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
