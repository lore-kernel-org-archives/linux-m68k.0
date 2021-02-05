Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408C3C433E0
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 13:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECD2764F38
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 13:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhBEND6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Feb 2021 08:03:58 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:48522 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbhBENBd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Feb 2021 08:01:33 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DXFr80dwTz1qs3H;
        Fri,  5 Feb 2021 13:59:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DXFr803tlz1tYTs;
        Fri,  5 Feb 2021 13:59:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id vJkKCHb1hqKy; Fri,  5 Feb 2021 13:59:51 +0100 (CET)
X-Auth-Info: t4HE+BK5wQRCu1XDCfX+HaOtglUJ6QAlyQeLE9TtsrCU71f5bkuHerxzx5Omf1Vu
Received: from igel.home (ppp-46-244-178-206.dynamic.mnet-online.de [46.244.178.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  5 Feb 2021 13:59:51 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 52CF92C36FC; Fri,  5 Feb 2021 13:59:50 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     sammy@sammy.net, geert@linux-m68k.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] arch: m68k: include: asm: Reconstruct the sentence in
 file sun3ints.h
References: <20210205120455.1289448-1-unixbhaskar@gmail.com>
X-Yow:  I'm sitting on my SPEED QUEEN..  To me, it's ENJOYABLE..
 I'm WARM..  I'm VIBRATORY..
Date:   Fri, 05 Feb 2021 13:59:50 +0100
In-Reply-To: <20210205120455.1289448-1-unixbhaskar@gmail.com> (Bhaskar
        Chowdhury's message of "Fri, 5 Feb 2021 17:34:55 +0530")
Message-ID: <87czxeisah.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Feb 05 2021, Bhaskar Chowdhury wrote:

> -/* master list of VME vectors -- don't fuck with this */
> +/* master list of VME vectors -- don't do anything with this */

don't mess with this

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
