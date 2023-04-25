Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E88DC77B71
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 11:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjDYLZX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 07:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbjDYLZX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 07:25:23 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043DE9D
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 04:25:19 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q5KRb3JcBz1sB7V;
        Tue, 25 Apr 2023 13:25:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q5KRb2hrcz1qqlY;
        Tue, 25 Apr 2023 13:25:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id gSI1yn90z9A1; Tue, 25 Apr 2023 13:25:14 +0200 (CEST)
X-Auth-Info: 6cXSSK+dVQOyGl8Q7+Q9Z9tQFdVcSLh+AUAEAmkqdRCX7j3jAX/uLWrimMxHON6l
Received: from igel.home (aftr-82-135-86-255.dynamic.mnet-online.de [82.135.86.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 25 Apr 2023 13:25:14 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 401AF2C1264; Tue, 25 Apr 2023 13:25:14 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> (Finn
        Thain's message of "Tue, 25 Apr 2023 11:55:11 +1000 (AEST)")
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
        <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
        <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
        <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com>
        <87fs8sz6e9.fsf@igel.home>
        <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com>
        <878rekz0md.fsf@igel.home>
        <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com>
        <87o7nfyd7e.fsf@igel.home>
        <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com>
        <87jzy3y79y.fsf@igel.home>
        <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
        <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
        <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
        <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
        <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
        <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
        <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
        <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
        <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
        <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
X-Yow:  HOW could a GLASS be YELLING??
Date:   Tue, 25 Apr 2023 13:25:14 +0200
Message-ID: <87y1mgryp1.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 25 2023, Finn Thain wrote:

> It turns out that doing so (patch below) does make the problem go away. 
> Was the exception frame getting clobbered?
>
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index b9f6908a31bc..94104699f5a8 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t frame_size)
>  {
>  	unsigned long usp = sigsp(rdusp(), ksig);
>  
> -	return (void __user *)((usp - frame_size) & -8UL);
> +	return (void __user *)((usp - 256 - frame_size) & -8UL);

Probably the issue is that a bus error exception should never start
signal delivery when returning to user space.  On the 030 returning from
a bus error resumes the execution of the faulting insn (unlike the
040/060 which restart it), and the saved USP may have the original value
from before the insn started (modified registers may not be updated
until the insn is complete or just before the final bus cycle).  Signal
delivery should only ever happen at insn boundaries.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
