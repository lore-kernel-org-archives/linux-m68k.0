Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8954C4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 14:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 896D760241
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 14:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhGYNoS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 09:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhGYNoS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 09:44:18 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D517C061757
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 07:24:47 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4GXlgT4TlKz1sByw;
        Sun, 25 Jul 2021 16:24:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4GXlgT36ssz1rmXy;
        Sun, 25 Jul 2021 16:24:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id c2MbuW-tLki4; Sun, 25 Jul 2021 16:24:36 +0200 (CEST)
X-Auth-Info: S2GRYpvJ6Ix5RcLIMInDsuaROFJPacPETA21g+GmTBpMaYzcOEO82V4CzZyl1ltH
Received: from igel.home (ppp-46-244-170-80.dynamic.mnet-online.de [46.244.170.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 25 Jul 2021 16:24:36 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id C05D52C2617; Sun, 25 Jul 2021 16:24:35 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@uclinux.org>, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Brendan Jackman <jackmanb@google.com>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Fix asm register constraints for atomic ops
References: <20210725104618.365790-1-geert@linux-m68k.org>
X-Yow:  Look!  A ladder!  Maybe it leads to heaven, or a sandwich!
Date:   Sun, 25 Jul 2021 16:24:35 +0200
In-Reply-To: <20210725104618.365790-1-geert@linux-m68k.org> (Geert
        Uytterhoeven's message of "Sun, 25 Jul 2021 12:46:18 +0200")
Message-ID: <87r1fm4gkc.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 25 2021, Geert Uytterhoeven wrote:

> Depending on register assignment by the compiler:
>
>     {standard input}:3084: Error: operands mismatch -- statement `andl %a1,%d1' ignored
>     {standard input}:3145: Error: operands mismatch -- statement `orl %a1,%d1' ignored
>     {standard input}:3195: Error: operands mismatch -- statement `eorl %a1,%d1' ignored
>
> Indeed, the first operand must not be an address register.  Fix this by
> adjusting the register constraint from "g" (general purpose register) to
> "d" (data register).

You should also allow immediate ("i").

There is the ASM_DI macro for that, but since CONFIG_RMW_INSNS is never
defined for CONFIG_COLDFIRE, it probably doesn't matter.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
