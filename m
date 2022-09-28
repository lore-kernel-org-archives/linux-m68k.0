Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B090C32771
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Sep 2022 23:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiI1XOE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiI1XOD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Sep 2022 19:14:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449FA7CA8C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 16:14:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF571B820F5;
        Wed, 28 Sep 2022 23:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D6C433C1;
        Wed, 28 Sep 2022 23:13:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JBtQtJkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664406835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v/cyttnX7IBB13ofxELqP1H+N0vDWsSp9Fd54rR0iDQ=;
        b=JBtQtJkAnTPelRTf2vqyjQIGYw4O/COcB2HFL6p/nNLwm/nKbmW3EnW04YzAzqjd2miXZ5
        0DZzRJw5Q904zG5uvy+8TywwekQuw451uieYGkJgckp3EQOsZxS2bYhVDXj7uUAmbdk/dA
        ffaq+oYVB0Xt9wDZi4Mf/oYw+mkKXCg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce47030d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 28 Sep 2022 23:13:54 +0000 (UTC)
Date:   Thu, 29 Sep 2022 01:13:52 +0200
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Message-ID: <YzTVMCTGV9IvcJ0O@zx2c4.com>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
 <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
 <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
 <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 26, 2022 at 11:42:37PM +0200, Jason A. Donenfeld wrote:
> On Mon, Sep 26, 2022 at 11:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > Le 26/09/2022 à 23:40, Jason A. Donenfeld a écrit :
> > > On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wrote:
> > >>
> > >> Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
> > >>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> > >>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> > >>> padding to fill this out as such.
> > >>>
> > >>> Also, break apart the padding additions from the other field length
> > >>> additions, so that it's more clear why these magic numbers are being
> > >>> added, and comment them too.
> > >>>
> > >>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >>> Cc: Laurent Vivier <laurent@vivier.eu>
> > >>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >>> ---
> > >>>    hw/m68k/bootinfo.h | 10 ++++++----
> > >>>    1 file changed, 6 insertions(+), 4 deletions(-)
> > >>>
> > >>
> > >> Applied to my m68k-for-7.2 branch
> > >
> > > What about 1/2?
> > >
> >
> > I'd like to wait a little to see what happens on the linux side.
> 
> Alright, makes sense. Just please don't forget about it.

Okay, all set. Uneventful.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?id=f1bb20c8be1929743fdb313b4770601afc39c1b7

Jason

