Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43581C7619A
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Mar 2023 00:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjC0ApF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Mar 2023 20:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjC0ApE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Mar 2023 20:45:04 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A564C49F5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 17:45:02 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 722A532007E8;
        Sun, 26 Mar 2023 20:44:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 26 Mar 2023 20:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679877899; x=1679964299; bh=WwX1H44IDWbZ1
        rWlzPTJUXxT76kALWLWEUcDXD+4EHo=; b=RHC1WbMyBegyk+9CXgysvP/XIBJVE
        GbvWfOxqsz6EJTVAHVSqMJgYTUi3tlS6hZe4Ics+O3jcWXaSWNib/+8Xedlc17Xv
        N2AQp0XYNYwg+WQ62Ni97kSaSHFiOn4RY+zjm5Kknas88DLXM3BaHws/e39KXA/w
        7OZ3p8uXtXuKXgmstXeF4hXAF3m0ivnPpix0OHKFaNCLGLvYxE1cQO1WuT8sd5RM
        uHsurcGPfnagRS+BZ2urSRe0Tmme/bTom1GsBaAIfx5759PZp4LEL9r5+oJpwAAN
        z8XLQ5ZzEXKW4mM66kSsLQippxkHauLgPwDhH2/pP+4uo5xLCYuuE3Oyg==
X-ME-Sender: <xms:CucgZBKgktGLhhQS3z0qNDfC4oAcm8bzssP3xDIRK0moX5iL7BNS3w>
    <xme:CucgZNJvzGuv-zBJa98-SGuFhUM5L7Xh1R4um9gYJqn-vI7s9q621lL7cK4n1dAJf
    eomRfsldnRgWY8k_rw>
X-ME-Received: <xmr:CucgZJugeruVSzyZQjPYHQ06UJd68Y4AheJEeBcYtonVamaXO-L8JeTpub4PpRSV1O_M8sGxgmy0mFZjeAV-sfLawWNwsZRSKoo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehuddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefujgfkfhggtgesthdtre
    dttddtvdenucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhig
    qdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnhepffejhfejfedugfffudejleeije
    ffudffveekteduieeihfelvdefheeghefhudefnecuffhomhgrihhnpehsohhurhgtvgif
    rghrvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:CucgZCYQSb1nltLy_wEk7L_Kw8lkZTRC6qdymup4Ib39lsYSDBDr-A>
    <xmx:CucgZIbI6U80Aqm_VvTgy1C4beDw6KzBiVWyifu27ZjFrKE4mnC0Bw>
    <xmx:CucgZGBhIaEI3EZEU3JomJ9e7ouw9IZbaMHkjY47zBPQqJRR7X782A>
    <xmx:C-cgZO0K7OVAqwnPHKjUKRDgqcUM1sDMC1Kb3xHaJj4Hl1kqFxkTBA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Mar 2023 20:44:57 -0400 (EDT)
Date:   Mon, 27 Mar 2023 11:47:59 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
cc:     debian-68k@lists.debian.org
Subject: Re: gdb failure: "core file format not supported"
In-Reply-To: <ca000c1c-899a-fa5a-90f5-d44682e54740@linux-m68k.org>
Message-ID: <1fe7014b-84c5-2229-9b26-d57a3e4e3ddb@linux-m68k.org>
References: <fa0774b8-3ed2-8b87-defd-17fbb492922f@linux-m68k.org> <ca000c1c-899a-fa5a-90f5-d44682e54740@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


I wasn't able to add the linux-m68k list to the bug report Cc list.

I'm forwarding this as I don't know the answer to Tom's question...

On Sat, 25 Mar 2023, tromey at sourceware dot org wrote:

> https://sourceware.org/bugzilla/show_bug.cgi?id=30273
> 
> Tom Tromey <tromey at sourceware dot org> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |tromey at sourceware dot org
> 
> --- Comment #1 from Tom Tromey <tromey at sourceware dot org> ---
> This is probably a regression due to this patch:
> 
> commit 3eba3a011a89c75c10bd1860eee4589e65697165
> Author: Tom Tromey <tromey@adacore.com>
> Date:   Mon Sep 14 08:30:10 2020 -0600
> 
>     Various m68k fixes for gdb
> 
> 
> When I debug gdb I see it decides this core file is
> GDB_OSABI_SVR4, not GDB_OSABI_LINUX.  This happens
> because m68k_osabi_sniffer takes this branch:
> 
>   if (elfosabi == ELFOSABI_NONE)
>     return GDB_OSABI_SVR4;
> 
> From elf/common.h:
> 
> #define ELFOSABI_NONE         0 /* UNIX System V ABI */
> #define ELFOSABI_HPUX         1 /* HP-UX operating system */
> #define ELFOSABI_NETBSD       2 /* NetBSD */
> #define ELFOSABI_GNU          3 /* GNU */
> #define ELFOSABI_LINUX        3 /* Alias for ELFOSABI_GNU */
> 
> 
> So I guess one question is why this core file isn't marked
> as ELFOSABI_LINUX.
> 
