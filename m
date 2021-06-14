Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5286C48BE6
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 07:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88CC761246
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 07:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhFNHuG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Jun 2021 03:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNHuG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Jun 2021 03:50:06 -0400
X-Greylist: delayed 457 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Jun 2021 00:48:03 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A9EC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jun 2021 00:48:03 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4G3Ndy27nXz1s46p;
        Mon, 14 Jun 2021 09:40:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4G3Ndy1kVmz1r0wD;
        Mon, 14 Jun 2021 09:40:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id evlp0gQGrCew; Mon, 14 Jun 2021 09:40:21 +0200 (CEST)
X-Auth-Info: xgerEHuYfcCI0LSNjXKT74y0B/rzWG4/zHgVlaj+zpyt7+wTjKC/KKr8MX/bUdhS
Received: from igel.home (ppp-46-244-171-127.dynamic.mnet-online.de [46.244.171.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 14 Jun 2021 09:40:21 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id B420C2C3630; Mon, 14 Jun 2021 09:40:20 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
References: <87sg1p30a1.fsf@disp2133>
        <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
        <eab743c3-7deb-33c3-030b-6686ff1f5e94@gmail.com>
X-Yow:  I'LL get it!!  It's probably a FEW of my ITALIAN GIRL-FRIENDS!!
Date:   Mon, 14 Jun 2021 09:40:20 +0200
In-Reply-To: <eab743c3-7deb-33c3-030b-6686ff1f5e94@gmail.com> (Michael
        Schmitz's message of "Mon, 14 Jun 2021 19:13:12 +1200")
Message-ID: <87a6nssxln.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jun 14 2021, Michael Schmitz wrote:

> do we need to add
>
> .globl __sys_exit, __sys_exit_group
>
> (and perhaps __sys_clone3) at the start of entry.S?

ENTRY takes care of that.  You wouldn't be able to link without that
anyway.

> We have that for __sys_fork, __sys_clone and __sys_vfork.

Not really needed.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
