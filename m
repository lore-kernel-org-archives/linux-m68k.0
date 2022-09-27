Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A35C07E9D
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Sep 2022 13:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiI0NKG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiI0NKA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Sep 2022 09:10:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2B7B1BA5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 06:09:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2CCE3B819D6;
        Tue, 27 Sep 2022 13:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523FEC433D6;
        Tue, 27 Sep 2022 13:09:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nY8c4m6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664284167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fZPP5PahCbJY5jGiCruWB3XwrKpCIDgkTFtW5rPCQtk=;
        b=nY8c4m6pbiX67e7lxXWDvjYm3OGXZTPS9yhS0MYqMpf5zzMIvrg6aHptPRHOkfbOzb4OD1
        dcIyVR631A9X+HhqXCQGH4kRcPuzAyQl2Zy9SvAw3SBIUB9TdezDR82uryD9bbCHzZTamd
        XEUWlmllkmeLsoothqluqcTNsTYu5BI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61342710 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 27 Sep 2022 13:09:27 +0000 (UTC)
Date:   Tue, 27 Sep 2022 15:09:21 +0200
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4 3/3] m68k: generate new RNG seed on reboot
Message-ID: <YzL2AXQeVC4XvPPf@zx2c4.com>
References: <20220926113754.1256358-1-Jason@zx2c4.com>
 <20220926113754.1256358-3-Jason@zx2c4.com>
 <CAHmME9qLcfT5Mjw1cudhA-zGaLUubkPCTF7trw1ek40==BwumQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9qLcfT5Mjw1cudhA-zGaLUubkPCTF7trw1ek40==BwumQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 26, 2022 at 03:13:01PM +0200, Jason A. Donenfeld wrote:
> Hi Geert,
> 
> On Mon, Sep 26, 2022 at 1:38 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Rather than rebooting into a system with no entropy, regenerate the RNG
> > seed before rebooting, so that the new system has a fresh seed.
> >
> > Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Laurent made a compelling case *against* this approach. So feel free
> to drop this 3/3 patch. However, 1/3 and 2/3 should still be
> committed.

For Geert's ease, I'll send a v5 with 3/3 dropped.

Jason
