Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05520C2FC0E
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Aug 2023 00:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356659AbjHRAgx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 20:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356724AbjHRAg0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 20:36:26 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4202D57
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 17:36:25 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 177725C00BD;
        Thu, 17 Aug 2023 20:36:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 17 Aug 2023 20:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692318982; x=1692405382; bh=graOaSyL+gJHo
        fE3kSpIjeFP2fRcpOoLkuYw/QcD6Do=; b=drFthJ7DaRWhRPS0VcAX+pqRuH+ub
        8WBxqlG2pPYBfDmYwqTtYQAB0kKfYxZB5+h13TXgQwl7i2CUeVsosa3DZOQf2x1I
        vnhBpvrbXDteTLXeOFeYxqxdA18R7Aw70d7ISfJGshh3mj7a0olcw52KqDYIFkxT
        Lj7vGfUqyhjGaH2T0Jjm09KBLYejeD74gipCDOYXfnNniiCxSiG9xn5ratYBYfnk
        cBFGIrTqUoSizP6+IFKKk/StGxv6t28Bge6EM+LPbNlT7HXbx1kndAlq92dq6kMO
        NL2V0NsG4daVbHwWKx95BDth3UsJHyrrXTGdwxFCI2qu9TM6civZR5Iow==
X-ME-Sender: <xms:Bb3eZCmF5H2la-MnpJO33uI63K0nPR6MmVnWXJ8Byfg1KCMriVts-w>
    <xme:Bb3eZJ2ksYGLTIsEQ2FYBkODRjIbnCFsSitG4bZhgcP1vNqeu6d9FUZchzZyXJF09
    nZyUdaWuSoe4yrPr_U>
X-ME-Received: <xmr:Bb3eZAp9pLBd8aY_fqVaT_umC-2GwCnbH0CvHxGLIwHQ_lZVQjg9JRsIrO3Rw7oMVQlHzAmvbYrhMM4kNiWznUQ27P11zuK8NDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduvddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Bb3eZGmlezSj7A40WCvfSXCYKIXaTLaab5mqCfpS3vCBLv9HI8NG9g>
    <xmx:Bb3eZA2IUTZOfJxTgr0FxrFxgKw6IBr2SuVmEjBwkkPWQ1B313uAuA>
    <xmx:Bb3eZNs31ZMK65Bf--7PiFPYZE45vaWcUveYRfLUhUE30L_rDNucpw>
    <xmx:Br3eZOCprh0pszdZiIam_XvH126_oSEqCn5emmTyriWpr61A9aFfWw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Aug 2023 20:36:18 -0400 (EDT)
Date:   Fri, 18 Aug 2023 10:36:31 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
In-Reply-To: <46d8fe18-5d82-6dcf-3be7-ae78642ce3af@gmail.com>
Message-ID: <a5df965a-d490-bfd4-ac3d-52e52b8b2a4a@linux-m68k.org>
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com> <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <46d8fe18-5d82-6dcf-3be7-ae78642ce3af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 18 Aug 2023, Michael Schmitz wrote:

> > I think the patch could be simplified by dropping the dynamic memory 
> > allocation...
> 
> If using a private data pointer field for an int bitmask is acceptable 
> use ...
> 

I thought that was implicit in Geert's response.

I used a similar technique in drivers/nubus/proc.c and it didn't bother 
anyone.

> I'll see if I can find any performance impact from the additional 
> swap_data flag. If there's none, your solution may be cleaner.
> 

It was the maintenance impact of the extra code that motivated my 
suggestion. However, by avoiding kalloc we also avoid having to 
dereference the pointer in the fast path.
