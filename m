Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D539CC61DA4
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Feb 2023 23:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjBCXhs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 3 Feb 2023 18:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjBCXhr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 3 Feb 2023 18:37:47 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F5A8A7FC
        for <linux-m68k@lists.linux-m68k.org>; Fri,  3 Feb 2023 15:37:39 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 49440320030E;
        Fri,  3 Feb 2023 18:37:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 03 Feb 2023 18:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675467456; x=1675553856; bh=SMr47jTnar81pJNydon8MrHAuYDy
        yMrr+Blb3ia5WVg=; b=REw9WM0GjaLrjPWyS8r5jP6bWN8CuhUud4QsvmXoNStk
        HmasB4yXWYBExNnE3e4nCRmajMmXEH8cnaiP+KbEv4QWjMa9+mDPnEh7uNg0j3hu
        MiY+MrYGFliru0zL7y6+oBvJuBSyIUA8N71qDShgfd3WYLoNj8LCSBnRGR5bwOcX
        1NX5NDvjBYo3PXprvs5ph0UHNXSqJhWJrJBTgHJ1BAs7TRiTIFJu+USqFAGfdHL3
        +ixKFgVeASZ5SQH/OfuM067lcrc/RzSsd+saIFsOVjm4Jaj4bYCATd4Y5XhcgXey
        M5r+Vvn8Arp46NCoywd2b21EExLJlo3aFrgV/B06fw==
X-ME-Sender: <xms:wJrdY_MjWNIXx4EcfNCEgAYLdi1u78Dm9mF9Ztd8xLTJ95AEXo7Rdg>
    <xme:wJrdY5-8zeU0n7OTOWd1qb2T7I7qAo-kaKMb28tRcIBa5t6egPKqaWFkooSGBK51h
    sDgnv6tncHlpKDgYMs>
X-ME-Received: <xmr:wJrdY-SBBGxi1knGYtQP4AiXX9BQi57m792ilJu8KxYnC_vLJUgF3YQbYQyDmL2T-Oj0kQi6t60w6WYHndpPmW0n8FGl87qIZ7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeguddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekledtheeufeefgfeffefhveeffeevgeeugedvjeeugffgveehfeffjeff
    veeigfenucffohhmrghinhepshdtudhmohhunhhtkhgvrhhnfhhsrdhshhdpmhhouhhnth
    hkvghrnhhfshdrshhhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:wJrdYzuSscVMddP40EgmnIrv_3iewE39LMw14Lg6vVP1E09ZuMB3tw>
    <xmx:wJrdY3cJpOrKeu6_DCmcqhxPA9ontlvD4MnM3OFuqdYD8D2elMHZ6g>
    <xmx:wJrdY_2N87TUkiM4TxhvnnzrjN0hmc_zVENIPhj55VKMiBPnjKT12A>
    <xmx:wJrdY_GJlKiELIdabSBKl4zcp88_Nu1BDy2HliJSYC5yLuSmshl-bA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 18:37:34 -0500 (EST)
Date:   Sat, 4 Feb 2023 10:39:39 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Stan Johnson <userm57@yahoo.com>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: stack smashing detected
In-Reply-To: <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
Message-ID: <667fa6a9-a760-2116-5f76-a01e078c8079@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com> <e7574759-4870-d554-dd63-17da220270f1@gmail.com> <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 1 Feb 2023, Stan Johnson wrote:

> 
> After logging the start and end of each script, I see that the "stack 
> smashing detected" error often happens while running 
> "/etc/rcS.d/S01mountkernfs.sh" (/etc/init.d/mountkernfs.sh). I'll try to 
> isolate it to a particular command.
> 

That brings to mind some other unresolved initscript failures, also 
involving 68030, which were accompanied by "page allocation failure".

But it's hard to blame "stack smashing detected" on a page allocation 
failure since the latter always produces a very noisy splat in the kernel 
messages.

Have you reproduced the error with Debian's kernel package?

If not, please refer to private correspondence from me dated 10 December 
2022 regarding setting up /etc/initramfs-tools so as to produce a suitably 
small initramfs.

To save time, I recommend using QEMU and an up-to-date Debian/m68k SID 
virtual machine to produce the vmlinux and initrd files needed for use 
with Penguin on your slower machines.
