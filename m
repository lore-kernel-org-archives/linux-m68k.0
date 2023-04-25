Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD7C77B61
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 01:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjDYBvm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 21:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbjDYBvl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 21:51:41 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5669EF7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 18:51:40 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BB84F5C01D8;
        Mon, 24 Apr 2023 21:51:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 24 Apr 2023 21:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682387495; x=1682473895; bh=V9x5vQDYrS5EE
        ZXyih1aCChsHP30E1z4YrMEbXxwWlU=; b=TmrOM+ygdSS/i2DxvJE8/CzGDVqHx
        VY7D1hMZ+WK1dqtnhWHkxB3G/9WYjobnEstT9tqg6BHsR8XEn3U4+rhLTx7OrOtD
        698xbqco6xhSfE9WSqKl0C6UHDymw4ksd1uG9Ki7noHt9ZXIf2YCyeXQNdTd/Myt
        313zC0K0vB3qCFNl95KnTF3y/pzKnbVzd5alouT6cROyljAAmAVcS3iQtnHRzT0f
        uEgxf75GuosiohgVsw+FnzQXo1kNYit+sqtjWs0vnzzhPJGXBOJhKim0mTrpYDnH
        cGfspYvLILstL/svhXttlwr2eXpZdWXn9Ta/Yuiu80H3V2t2zCtrGPLqg==
X-ME-Sender: <xms:JjJHZKKqWnsPpXBLaufUHj1NIP6oAc7GOESDILqLXsQjFIMFq0CKRA>
    <xme:JjJHZCJPNgyvECZ5RKr4Djh8mht3JnZ4mVEJ_acqKhIzXocs9IbntvKRSu5BWAZGi
    868jb3uOYcHf5XJuDw>
X-ME-Received: <xmr:JjJHZKuV8GQksdgT_TSiWd3XMFCEthZt5O3-Piy4PF97jjFB3MZ98a0q1FvjD6GwQKA5zMQMMc2KVJFXPMJT6ES0rDuid8Tpoa8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:JzJHZPbHbqmqhtZDfBpLfc8Krtof84r2NMnQ1mjsZuYpwFtq8nSILg>
    <xmx:JzJHZBbs3ZIngDqkBWcO_alQOPiKVrrerQjsVlwkFbbbVsgBA_zCMQ>
    <xmx:JzJHZLDlxyORBBF_2mWveT2NMqoYRqAVYKPZ5Cm0QmahrGwXgsjdxg>
    <xmx:JzJHZCCd_G5ZaDXJib0P4i-KPNPfYlsw2hmZDsZslAmZ_nPrvnNcpQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 21:51:32 -0400 (EDT)
Date:   Tue, 25 Apr 2023 11:55:11 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
Message-ID: <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org> <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com> <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com> <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 25 Apr 2023, Finn Thain wrote:

> On Tue, 25 Apr 2023, Michael Schmitz wrote:
> 
> > As to a cause for the corruption: all the calculations in setup_frame 
> > and sys_sigreturn use fsize, but get_sigframe() masks off the result 
> > of usp - sizeof(sigframe) - fsize to place the entire frame at a 
> > quadword boundary.
> ...
> 
> I wonder if we are seeing some fallout from the issue described in 
> do_page_fault() i.e. usp is unreliable.
> 
>                 /* Accessing the stack below usp is always a bug.  The
>                    "+ 256" is there due to some instructions doing
>                    pre-decrement on the stack and that doesn't show up
>                    until later.  */
>                 if (address + 256 < rdusp())
>                         goto map_err;
> 
> Maybe we should try modifying get_sigframe() to increase the gap between 
> the signal and exception frames from 0-1 long words up to 64-65 long 
> words.
> 

It turns out that doing so (patch below) does make the problem go away. 
Was the exception frame getting clobbered?

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index b9f6908a31bc..94104699f5a8 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t frame_size)
 {
 	unsigned long usp = sigsp(rdusp(), ksig);
 
-	return (void __user *)((usp - frame_size) & -8UL);
+	return (void __user *)((usp - 256 - frame_size) & -8UL);
 }
 
 static int setup_frame(struct ksignal *ksig, sigset_t *set,
