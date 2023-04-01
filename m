Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D288AC6FD1D
	for <linux-m68k@archiver.kernel.org>; Sat,  1 Apr 2023 10:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjDAKSI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 1 Apr 2023 06:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDAKSH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 1 Apr 2023 06:18:07 -0400
X-Greylist: delayed 381 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 01 Apr 2023 03:18:04 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699331C1C6
        for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Apr 2023 03:18:04 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4PpXxl25jdz1s953;
        Sat,  1 Apr 2023 12:11:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4PpXxl0Vfdz1qqlW;
        Sat,  1 Apr 2023 12:11:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id l21SewfvkEMk; Sat,  1 Apr 2023 12:11:38 +0200 (CEST)
X-Auth-Info: s0bblsSdvczRp0PoZO9CWlKKHtfOTkzM/6lVPhPwCxg0+nDMs1ahMapG5hcwOFWw
Received: from igel.home (aftr-82-135-86-30.dynamic.mnet-online.de [82.135.86.30])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat,  1 Apr 2023 12:11:38 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 103C52C1299; Sat,  1 Apr 2023 12:11:38 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
        <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
        <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com>
        <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com>
        <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com>
        <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com>
        <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
        <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
        <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
        <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
        <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
        <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
        <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
        <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
        <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
        <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
        <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
        <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
        <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
X-Yow:  Maybe we could paint GOLDIE HAWN a rich PRUSSIAN BLUE--
Date:   Sat, 01 Apr 2023 12:11:38 +0200
In-Reply-To: <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> (Finn
        Thain's message of "Sat, 1 Apr 2023 20:27:14 +1100 (AEDT)")
Message-ID: <87zg7rap45.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 01 2023, Finn Thain wrote:

> So, in summary, the canary validation failed in this case not because the 
> canary got clobbered but because %a3 got clobbered, somewhere between 
> __wait3+24 and __wait3+70 (below).
>
> The call to __GI___wait4_time64 causes %a3 to be saved to and restored 
> from the stack, so stack corruption seems to be a strong possibility to 
> explain the change in %a3.
>
> But if that's what happened, I'd expect __GI___wait4_time64 to report 
> stack smashing, not __wait3...

The stask smashing probably didn't fire in __wait4_time64, because it
hit the saved register area, not the canary (which reside on the
opposite ends of the stack frame).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
