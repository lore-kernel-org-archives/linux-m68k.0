Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEE3C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 08:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B9660FBF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 08:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbhIMIBX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:01:23 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59583 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237776AbhIMIBW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 04:01:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E64D55C00C6;
        Mon, 13 Sep 2021 04:00:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 13 Sep 2021 04:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5QM9qy
        Rc4Q5kEWDPxeCoPAofAqx829qfsCMKaE4nyVA=; b=C2AffTEOM4OMnO6UVvrO2Q
        DlQBasosSQxoY+O+9FeDgtvEkkMR2PwXUwedGtuvtyJEgtko0qOEHWKzo3g6BBs4
        +ud3FXBsfLJr6LN8Hb+RAUGm3F+Rx4i9ll8MFuB6AIF9YYz4GDXZoJGGLbzwLIR6
        xutYvl1nS7sMlQDYaNzRpCAIn/1vveSS0fVvztyLWSmc4AFIGUH5V67K5pZQBeIv
        tFMRx8Yp2c7Z64/Mf9B7mU8hy/jYqJD/a5XIYU9x505e8leSALyXY+DJA1JuKvT+
        78tv3oHTyya3tXW7OGoRLmjTYa3SucMNtz78dkawzahhcbx+HRhFt8L5bJuuoTOg
        ==
X-ME-Sender: <xms:BgU_YUJj-adDaKCINYoqwzltGYdZ1ENPVmgoVhJW-B-kw1dgiAE4qw>
    <xme:BgU_YUKrKpmDeBom2hYivxGYRX2hjioSUlFlM3h66fzQyK35mSxu6aMUAIn0btexx
    GBQj_GPw8xHY9B6WgQ>
X-ME-Received: <xmr:BgU_YUuPQKHyo3KV2REUUGGW_fFBV746byZ_3x4orAtXFOP1oF6z0N9JtXQ6PlwKEh5uHQr-UN0RFJqfhZ34bYKjj0Vet_Oga3b_Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveff
    teeuudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:BgU_YRbRQRFChYXM3antCv4jaAVyiMGaOjzmYd_Lh0RqsqHKuQfWdQ>
    <xmx:BgU_YbaOa4uMLg2vbQx0413luQw_cToB56VgM3tRHZg2fyPdvsyPvQ>
    <xmx:BgU_YdDjseP_IVTUaocVUpYhrdR1Ly0LaeP_5xx4_iJo8XITpR3Cgw>
    <xmx:BgU_YSyp3RfeKd5O8ZX2InZVCpJOWBOhPLqIyDAoRxHrwXvM9uaZwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:00:03 -0400 (EDT)
Date:   Mon, 13 Sep 2021 17:59:55 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Mike Rapoport <rppt@kernel.org>, Sam Creasey <sammy@sammy.net>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
In-Reply-To: <YT7oDJhKHNVyHZU9@kernel.org>
Message-ID: <40687bcb-62c7-ec64-9e91-2d258b79d8a3@linux-m68k.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org> <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com> <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org> <YT7oDJhKHNVyHZU9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 13 Sep 2021, Mike Rapoport wrote:

> On Mon, Sep 13, 2021 at 03:17:33PM +1000, Finn Thain wrote:
> > On Mon, 13 Sep 2021, Michael Schmitz wrote:
> > 
> > > 
> > > I'm amazed this works - I'd expect the kernel text segment to get 
> > > trashed by the memory test routines.
> > 
> > I think the initramfs may get clobbered when the 'memtest' parameter 
> > is set. But that may be expected behaviour...
> 
> It's not the expected behaviour. The initramfs is clobbered because 
> memtest runs before initramfs memory is reserved. The patch below (not 
> even compile tested) should help.

Thanks, Mike.

> Now, for some reason the reservation of initrd does not happen on SUN3, 
> which is probably wrong, so maybe we can drop that #ifndef CONFIG_SUN3 
> before #ifdef CONFIG_BLK_DEV_INITRD.
> 
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 4b51bfd38e5f..4ca8f1120abc 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -338,12 +338,6 @@ void __init setup_arch(char **cmdline_p)
>  		panic("No configuration setup");
>  	}
>  
> -	paging_init();
> -
> -#ifdef CONFIG_NATFEAT
> -	nf_init();
> -#endif
> -
>  #ifndef CONFIG_SUN3
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	if (m68k_ramdisk.size) {

The only reason I can think of for eliding this code (already conditional 
on m68k_ramdisk.size and CONFIG_BLK_DEV_INITRD) would be to work around a 
bootloader or firmware bug on Sun 3. 

Sam?
