Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDBC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 06:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0CCE60F92
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 06:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbhIMGoE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 02:44:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237357AbhIMGoD (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 02:44:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E516360FC1;
        Mon, 13 Sep 2021 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631515368;
        bh=//yJS00kCgRAGWd3ig16JMKVAssQYTlZ7ZWvvlYhfIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jcFBt6MGNGTNWCUWVPBZ3OgrNqB3xkT7qMIp3JUKE3aqW968bDs921bjMdzew4alh
         IicudgWJqazYRNBG1twYtuSbSFikCGRObDnkXX+gdWYCU0DRvbln3alAMqkiFX4GGD
         4XnPuFfAwUpiCa5IJ9k4sALUzQ/pW+mEJ0BAJbxr4feY9Y6OOWTU4oHdHjc3q+VzIi
         DzbuZwJlHk+f0aA1A5JbRGZZ0c7vJzmI82WISJm9t+g2007pF4PDgByedd6sK6nLLw
         +SdHJY4APy9ORkp07Hb//fIODYx0sT9/bAJ9mTe5HE9O9rdjQRhOTYgx7AX0Ci4Pxb
         +Py4YHHiX0m/A==
Date:   Mon, 13 Sep 2021 09:42:41 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
Message-ID: <YT7y4X+5XWYoAi0x@kernel.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
 <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
 <YT7oDJhKHNVyHZU9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT7oDJhKHNVyHZU9@kernel.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 13, 2021 at 08:56:35AM +0300, Mike Rapoport wrote:
> Hi Finn,
> 
> On Mon, Sep 13, 2021 at 03:17:33PM +1000, Finn Thain wrote:
> > On Mon, 13 Sep 2021, Michael Schmitz wrote:
> > 
> > > 
> > > I'm amazed this works - I'd expect the kernel text segment to get 
> > > trashed by the memory test routines.
> > 
> > I think the initramfs may get clobbered when the 'memtest' parameter is 
> > set. But that may be expected behaviour...
> 
> It's not the expected behaviour. The initramfs is clobbered because memtest
> runs before initramfs memory is reserved. The patch below (not even compile
> tested) should help. Now, for some reason the reservation of initrd does
> not happen on SUN3, which is probably wrong, so maybe we can drop that 
> #ifndef CONFIG_SUN3 before #ifdef CONFIG_BLK_DEV_INITRD.

BTW, for the short time I've been a bit involved in m68k I've spotted quite
a few things that seem broken on SUN3. Does anybody still run recent
kernels on it? I really doubt they boot on SUN3...

-- 
Sincerely yours,
Mike.
