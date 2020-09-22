Return-Path: <SRS0=3fPC=C7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC29EC2D0E2
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 13:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 740B5206C9
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 13:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgIVNWd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Sep 2020 09:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIVNWd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Sep 2020 09:22:33 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D15C061755
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Sep 2020 06:22:31 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Bwhmz33jPz1rvmN;
        Tue, 22 Sep 2020 15:22:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Bwhmz2Yc2z1qyXQ;
        Tue, 22 Sep 2020 15:22:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id bWBnXox7eqz9; Tue, 22 Sep 2020 15:22:26 +0200 (CEST)
X-Auth-Info: r9hLLAGox8/vZ0QxNv6uPSxaHifFd06eSdul51f7sLhJxQZHMOTH9no63+NIp+xG
Received: from igel.home (ppp-46-244-171-76.dynamic.mnet-online.de [46.244.171.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 22 Sep 2020 15:22:26 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 015A02C28DE; Tue, 22 Sep 2020 15:22:25 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Quick test on real hardware requested to test qemu
References: <9a777d01-d8c2-445d-f6ea-94cd315d3474@physik.fu-berlin.de>
X-Yow:  I'm QUIETLY reading the latest issue of ``BOWLING WORLD''
 while my wife and two children stand QUIETLY BY..
Date:   Tue, 22 Sep 2020 15:22:25 +0200
In-Reply-To: <9a777d01-d8c2-445d-f6ea-94cd315d3474@physik.fu-berlin.de> (John
        Paul Adrian Glaubitz's message of "Tue, 22 Sep 2020 15:07:52 +0200")
Message-ID: <875z86q73i.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sep 22 2020, John Paul Adrian Glaubitz wrote:

> root@pacman:~# debfoster
> debfoster: /usr/include/atomic_ops/sysdeps/loadstore/atomic_load.h:31: AO_load: Assertion `((size_t)addr & (sizeof(*addr) - 1)) == 0' failed.

That a typical bad alignment check.  It should use __alignof__, not
sizeof.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
