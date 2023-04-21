Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FE9C7618E
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 08:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjDUI1J (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 04:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjDUI1H (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 04:27:07 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D768310DA
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 01:27:05 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 173BA5C013B;
        Fri, 21 Apr 2023 04:27:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 21 Apr 2023 04:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682065624; x=1682152024; bh=aKWamV7jkFj1+
        Uiu8femCJJEdytSmamq1/T0uAs64jY=; b=XW8v6Wzdni/VONvuNXd3BcheOP7Jj
        sUu50wF7mR74SGj22knuoYD9JCf9qRDJKXOKW5QVgVQbZN9nymSl/wCYjpNLn2W8
        IRzq5e28W8RjIhTw3Wj2Yv7ybbf0f6SALhqG9BWbOOWIBNY1naMcgK6tzDqnSnA/
        4/0xACpAi6z+G8qwYNrGWsrhlSZLQxFpS+Hj/26Nrv2XhfaM/b9z3cHxxfjf/ppX
        MPXg3D9guFaZroYtnvea0XGGVIPQSs3eEiH8BbcO8NImE7habA1Ocx3GTABxijWL
        gg7bKsaHIV2/70pZOACHiIhavhW4IUIO8NTHNuVlqxXvCnmjBAnAzGB2A==
X-ME-Sender: <xms:10hCZPL09eDwwU2OBnKkgSMgA9J4I79-dJFYxWwRqbLqNLsTrHOStQ>
    <xme:10hCZDLT2LUd66UVgSzRHu58V7vOFiKH4fZP3kuNavxxE66YOBsryJIcrXpSOmXtR
    _WqHZXiBSDaU2VnYnc>
X-ME-Received: <xmr:10hCZHswiUDS8WlTnvop2x2KThe2veDmqWZZwccYIUrp6_2V9_gQRFMd5aSq4ZEEDwry7RIj-t5hIIur484KWir7gWTvq8Ua3aI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:10hCZIaSP1zqhRcKQ3DvBj0FcefUzUcFg1_WFhAjTO9bnt6gUd_GBw>
    <xmx:10hCZGaLgehEj6pmkIFpwSbZGMEPZ70bgC4Z92gx8st8HUDIwAnjbQ>
    <xmx:10hCZMCaVNky41Sb4Woe9O_6vtSWefccG03qfgXGQq79l9RuxEmi3g>
    <xmx:2EhCZPDB3xXBuEaixrg3aXBOA9tGZzF0aYq8bjukEMxcDt6bJ999hg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 04:27:01 -0400 (EDT)
Date:   Fri, 21 Apr 2023 18:30:37 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
Message-ID: <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com> <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org> <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com> <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org> <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org> <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com> <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 21 Apr 2023, Michael Schmitz wrote:

> 
> How often did a page fault happen when executing moveml, in other 
> programs?
> 

The printk() I placed in bus_error030() was conditional on the short word 
at the instruction pointer. It didn't consider all forms of movem, just 
0x48e7 which is the start of "moveml X,%sp@-". This matched page faults in 
many of the programs that executed while booting to single user mode. I 
suppose most of them don't use signal handlers in the same way dash does 
otherwise they would probably be unreliable too.
