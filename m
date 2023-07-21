Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C987BEB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 12:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjGUMxF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 08:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbjGUMxE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 08:53:04 -0400
X-Greylist: delayed 12861 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Jul 2023 05:53:00 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626CA10CB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 05:53:00 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4R6qGf3WjBz1sBpn;
        Fri, 21 Jul 2023 14:52:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4R6qGd2Nx5z1qqlY;
        Fri, 21 Jul 2023 14:52:57 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id WpLDKYH3QzSl; Fri, 21 Jul 2023 14:52:56 +0200 (CEST)
X-Auth-Info: oFoyfXVN0Wqpf5UTtyG8V+1MDC84j5g+9/TizpxrRvFUi5A+3TFl7x8hie/ylkH8
Received: from igel.home (aftr-62-216-205-254.dynamic.mnet-online.de [62.216.205.254])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 21 Jul 2023 14:52:56 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 7B6EB2C0096; Fri, 21 Jul 2023 14:52:56 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
In-Reply-To: <ZLpzNAIVVLH9JYZ1@casper.infradead.org> (Matthew Wilcox's message
        of "Fri, 21 Jul 2023 12:59:48 +0100")
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
        <87jzut6acw.fsf@linux-m68k.org>
        <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
X-Yow:  YOW!!!  I am having fun!!!
Date:   Fri, 21 Jul 2023 14:52:56 +0200
Message-ID: <87zg3pa0k7.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 21 2023, Matthew Wilcox wrote:

> Do you happen to know if __GCC_ASM_FLAG_OUTPUTS__ is implemented for
> m68k so we can save the SMI instruction?

$ git grep __GCC_ASM_FLAG_OUTPUTS__ -- gcc/config
gcc/config/aarch64/aarch64-c.cc:  builtin_define ("__GCC_ASM_FLAG_OUTPUTS__");
gcc/config/arm/arm-c.cc:  def_or_undef_macro (pfile, "__GCC_ASM_FLAG_OUTPUTS__", !TARGET_THUMB1);
gcc/config/i386/i386-c.cc:  cpp_define (parse_in, "__GCC_ASM_FLAG_OUTPUTS__");

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
