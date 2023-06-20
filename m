Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C19FEB64D7
	for <linux-m68k@archiver.kernel.org>; Tue, 20 Jun 2023 21:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjFTV1D (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 20 Jun 2023 17:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjFTV1D (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 20 Jun 2023 17:27:03 -0400
Received: from mail.lichtvoll.de (luna.lichtvoll.de [194.150.191.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69010184
        for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Jun 2023 14:27:02 -0700 (PDT)
Received: from 127.0.0.1 (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
        (No client certificate requested)
        by mail.lichtvoll.de (Postfix) with ESMTPSA id 8B2CD7020CF;
        Tue, 20 Jun 2023 23:27:00 +0200 (CEST)
From:   Martin Steigerwald <martin@lichtvoll.de>
To:     debian-68k <debian-68k@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Artem Bityutskiy <dedekind1@gmail.com>,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Status of affs support in the kernel and affstools
Date:   Tue, 20 Jun 2023 23:27:00 +0200
Message-ID: <4858709.31r3eYUQgx@lichtvoll.de>
In-Reply-To: <25787bdeb7560871ebb8678a3f09f62eed418dc4.camel@physik.fu-berlin.de>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
 <5947812.lOV4Wx5bFT@lichtvoll.de>
 <25787bdeb7560871ebb8678a3f09f62eed418dc4.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Authentication-Results: mail.lichtvoll.de;
        auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi John, hi Artem, hi Michael.

John Paul Adrian Glaubitz - 13.06.23, 09:22:52 CEST:
> On Tue, 2023-06-13 at 09:20 +0200, Martin Steigerwald wrote:
> > John Paul Adrian Glaubitz - 13.06.23, 08:47:11 CEST:
> > > I was wondering what the current status of the affs driver in the
> > > kernel is, did it receive the fixes that Michael(?) was working
> > > on? I
> > > vaguely remember there were some issues with larger filesystems or
> > > so
> > > and that someone was working on fixing these issues.
> > 
> > (...)
> > I will reply to the other thread and ask again. Maybe it was just a
> > last question / answer round missing. Or maybe someone else can
> > confirm that the patch indeed went in.
> 
> I greatly appreciate that. Thanks a lot for taking care of this!

The Amiga RDB large partition fixes went in now.

Thanks to everyone involved! Special thanks to Michael for going through 
13 iterations!

https://lore.kernel.org/linux-m68k/10e23e7d-d2b0-f540-f0aa-ca83727fa10e@gmail.com/T/#m0eea1b4b33ff8d96ebfe35546bce3a67256ee166

----------  Weitergeleitete Nachricht  ----------

Betreff: Re: [PATCH v13 0/3] Amiga RDB partition support fixes
Datum: Dienstag, 20. Juni 2023, 22:28:34 CEST
Von: Jens Axboe <axboe@kernel.dk>
An: linux-block@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Kopie: linux-m68k@vger.kernel.org, geert@linux-m68k.org, hch@lst.de, 
martin@lichtvoll.de, fthain@linux-m68k.org



On Wed, 21 Jun 2023 08:17:22 +1200, Michael Schmitz wrote:
> another last version of this patch series, only change
> in this version is in the patch 2 subject (to better
> reflect what it's about), and adding Geert's review
> tag to said patch.
> 
> I hope I've crossed all i's and dotted all t's now...
> 
> [...]

Applied, thanks!

[1/3] block: fix signed int overflow in Amiga partition support
      commit: fc3d092c6bb48d5865fec15ed5b333c12f36288c
[2/3] block: change all __u32 annotations to __be32 in affs_hardblocks.h
      commit: 95a55437dc49fb3342c82e61f5472a71c63d9ed0
[3/3] block: add overflow checks for Amiga partition support
      commit: b6f3f28f604ba3de4724ad82bea6adb1300c0b5f

Best regards,
-- 
Jens Axboe




-------------------------------------------------------------

Thanks,
-- 
Martin


