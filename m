Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478BEC77B60
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 08:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbjDZIbg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 04:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239779AbjDZIbf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 04:31:35 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB113C1B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 01:31:32 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q5sXf42BHz1r1g4;
        Wed, 26 Apr 2023 10:31:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q5sXf3YZ2z1qqlS;
        Wed, 26 Apr 2023 10:31:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id V95lw2fYcRHw; Wed, 26 Apr 2023 10:31:29 +0200 (CEST)
X-Auth-Info: X3Q2eub8U3BGCQmaXmwzMfscNVr3W9mnTFEmqjpbKUv100R9U4OfU/q5bpcWX1qd
Received: from igel.home (aftr-82-135-86-255.dynamic.mnet-online.de [82.135.86.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 26 Apr 2023 10:31:29 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 5943D2C12B0; Wed, 26 Apr 2023 10:31:29 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com> (Michael
        Schmitz's message of "Wed, 26 Apr 2023 16:00:40 +1200")
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
        <87y1mgryp1.fsf@igel.home>
        <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
        <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org>
        <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
X-Yow:  I wonder if there's anything GOOD on tonight?
Date:   Wed, 26 Apr 2023 10:31:29 +0200
Message-ID: <87r0s73uzi.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 26 2023, Michael Schmitz wrote:

> The exception frame is copied to the signal frame for informational
> purposes only

This is not for informational purpose.  It is the interrupted context
that is restored by the kernel in the sigreturn syscall.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
