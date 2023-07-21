Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD11EB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 06:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGUGlz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 02:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjGUGlx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 02:41:53 -0400
X-Greylist: delayed 409 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jul 2023 23:41:49 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDED110
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 23:41:49 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4R6ftW04zfz1r68n;
        Fri, 21 Jul 2023 08:34:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4R6ftS3vbsz1qqlW;
        Fri, 21 Jul 2023 08:34:56 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 78iYrPK0QU8N; Fri, 21 Jul 2023 08:34:55 +0200 (CEST)
X-Auth-Info: 2Ku9O/UK/pZJZOQIYAlNVeLX9rYX1k1GCYHqeTNrHpAV+W0QTU314MiLB/2/FyNq
Received: from tiger.home (aftr-62-216-205-41.dynamic.mnet-online.de [62.216.205.41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 21 Jul 2023 08:34:55 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
        id 348071D1D78; Fri, 21 Jul 2023 08:34:55 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
In-Reply-To: <ZLmKq2VLjYGBVhMI@casper.infradead.org> (Matthew Wilcox's message
        of "Thu, 20 Jul 2023 20:27:39 +0100")
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
X-Yow:  After this, I'm going to BURN some RUBBER!!
Date:   Fri, 21 Jul 2023 08:34:55 +0200
Message-ID: <87jzut6acw.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 20 2023, Matthew Wilcox wrote:

> +static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
> +               volatile unsigned long *p)
> +{
> +       char result;
> +       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> +
> +       __asm__ __volatile__ ("eori %1, %2; smi %0"

Why are you using XOR if you want to clear a bit?  If it operates on a
byte, why does it receive a pointer to long?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
