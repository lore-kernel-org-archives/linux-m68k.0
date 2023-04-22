Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E3C77B78
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 20:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjDVUqk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 16:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjDVUqj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 16:46:39 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE9110FB
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 13:46:36 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q3k2f49rrz1s94n;
        Sat, 22 Apr 2023 22:46:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q3k2f3KLSz1qqlS;
        Sat, 22 Apr 2023 22:46:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id huaOluDlc4BD; Sat, 22 Apr 2023 22:46:33 +0200 (CEST)
X-Auth-Info: XaJTpyHOPhE4RTwXgQrWSSu8WQZFLW5/4TG/f7eaHC4CuotKAxvgsAywWaU7WqdU
Received: from igel.home (aftr-82-135-86-35.dynamic.mnet-online.de [82.135.86.35])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 22 Apr 2023 22:46:33 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 4C6FD2C1B57; Sat, 22 Apr 2023 22:46:33 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> (Michael
        Schmitz's message of "Sun, 23 Apr 2023 08:06:53 +1200")
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
        <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
        <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
        <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
        <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
        <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
        <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
        <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
        <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
        <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
        <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
        <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
        <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
        <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
        <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com>
        <87fs8sz6e9.fsf@igel.home>
        <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com>
        <878rekz0md.fsf@igel.home>
        <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com>
        <87o7nfyd7e.fsf@igel.home>
        <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com>
X-Yow:  Give them RADAR-GUIDED SKEE-BALL LANES and VELVEETA BURRITOS!!
Date:   Sat, 22 Apr 2023 22:46:33 +0200
Message-ID: <87jzy3y79y.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 23 2023, Michael Schmitz wrote:

> I'll see whether the signal context is available on the stack even if the
> handler isn't passed that parameter.

The signal context is always on the stack, and used by the
(rt_)sigreturn syscall.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
