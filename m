Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBBAC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 16:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB46D61BF7
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 16:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243528AbhIPQpa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 12:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245686AbhIPQmF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 12:42:05 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546B6C0613E8;
        Thu, 16 Sep 2021 09:14:11 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQu1Z-004kaR-Ej; Thu, 16 Sep 2021 16:14:09 +0000
Date:   Thu, 16 Sep 2021 16:14:09 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] m68k: leave stack mangling to asm wrapper of
 sigreturn()
Message-ID: <YUNtUXUVK5sRL5vw@zeniv-ca.linux.org.uk>
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
 <YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk>
 <08183665-f846-0c5e-a8c7-d0a65e78a3da@gmail.com>
 <YUKNn3erTbH+ytpM@zeniv-ca.linux.org.uk>
 <48dafad1-4f0c-4ab7-792c-b34a81d26799@gmail.com>
 <YUK4MWzI73lwRq0W@zeniv-ca.linux.org.uk>
 <59a44e17-bff8-041e-b704-2b1d97601ce7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a44e17-bff8-041e-b704-2b1d97601ce7@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 05:02:22PM +1200, Michael Schmitz wrote:

> The only question that remains is whether the third patch can also go to
> -stable. Most of my testing was with all three patches applied, I can drop
> the third one and retest if you're worries the third one is not appropriate
> for -stable.

	Up to m68k folks, really.  The current mainline mangle_kernel_stack()
is, er, not nice and the entire area is delicate enough as it is (witness the
bugs dealt with in the rest of the series), but strictly speaking the third
patch is not fixing any functional bugs.
