Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9307C77B7A
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 07:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240365AbjFMHau (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240203AbjFMHas (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 03:30:48 -0400
X-Greylist: delayed 602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 13 Jun 2023 00:30:35 PDT
Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D511B0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:30:35 -0700 (PDT)
Received: from 127.0.0.1 (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
        (No client certificate requested)
        by mail.lichtvoll.de (Postfix) with ESMTPSA id 5AE5A6F4D58;
        Tue, 13 Jun 2023 09:20:30 +0200 (CEST)
From:   Martin Steigerwald <martin@lichtvoll.de>
To:     debian-68k <debian-68k@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Status of affs support in the kernel and affstools
Date:   Tue, 13 Jun 2023 09:20:29 +0200
Message-ID: <5947812.lOV4Wx5bFT@lichtvoll.de>
In-Reply-To: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Authentication-Results: mail.lichtvoll.de;
        auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

John Paul Adrian Glaubitz - 13.06.23, 08:47:11 CEST:
> I was wondering what the current status of the affs driver in the
> kernel is, did it receive the fixes that Michael(?) was working on? I
> vaguely remember there were some issues with larger filesystems or so
> and that someone was working on fixing these issues.

Well I just searched for the large size fixing patches discussed on 
linux-m68k mailing list under subject titles "Amiga RDB partition 
support fixes":

While I found a steady stream of fixes for affs, including related to 
Amiga permission bit handling, quite recent fixes, even in 2023, I did 
not found that size fixing patch.

I recalled a discussion where Michael Schmitz talked to Jens Axboe after 
I asked whether the patch got in on 2023-08-21. I thought back then it 
would have went in, but maybe the last question asked by Jens Axboe did 
not get answered?

At least I did not found the patch in git history. Maybe I made a 
mistake during search.

I will reply to the other thread and ask again. Maybe it was just a last 
question / answer round missing. Or maybe someone else can confirm that 
the patch indeed went in.

Best,
-- 
Martin


