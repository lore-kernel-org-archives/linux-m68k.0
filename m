Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F316C001DB
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 23:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjHNXb7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 19:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbjHNXbd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 19:31:33 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5FE1710
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 16:31:32 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1483D5C0087;
        Mon, 14 Aug 2023 19:31:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 14 Aug 2023 19:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692055890; x=1692142290; bh=OCyuukVndEsW3
        0/aHmS+fZ5s8RKrKz5XtnTVe8Af6Dc=; b=ts6+c5o+VDAI+FhnCgkXR+LkthzY1
        P9g6pKSDHG6uazCFfXRaui0HDT1UBSGtKwh6Q+Z0xEFxwa2hYTixGQR37/ir6m0n
        pE3KwXg5KRQ9xn8OXU0RKN0r2lPiR9xlsd43cKRzG33MEoKAG+hDcW1npt0+Zfvt
        wq3tICHk2ZFS9gOiCu68e5PbQsOJ+2IXLXoG4a19RiTsrVKgcGWVAf93at9iTB8M
        vY1f26n2Uv92Ps/TfHXUH78S3mQQEKlZKe9i8NqPcVr0XkszdQjgFaZGG0nRGMhe
        evlWbLg8XGklTPjblaLOPbyhjhuy/e7nlMpxdFrh4pQh99mkZgXY143MQ==
X-ME-Sender: <xms:UbnaZLG7Z57X2m73A1eIskulBYB7XO5pY24-5JVKGcM7e683BNFkdA>
    <xme:UbnaZIUM7nFDUyghOQxzqWn3Ow9xjp9u-uItMP001w5Z2RLtCWcOtJsZMYNAie7mF
    g8lAwyNUSPIFFqAaoE>
X-ME-Received: <xmr:UbnaZNIqlznj11lHnps99rj3uk4vgif5O6AoKl43bmu1AQAZfLlRcONhyTUudTlN3U7bhl8DNI22j8LjL-2gEPE5EIATb-AfBCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtiedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:UbnaZJFTUTDJELlWI-YuraBxGUDkCI_m5HKyWp4Z7Y-Fbz389BK3Mw>
    <xmx:UbnaZBWfpKeELgqjaaUHmk5FscrtMX5I6vEg4V9_xWNQVOfgz7PjNg>
    <xmx:UbnaZEM2R6ZxZ6nnl1Q1MDDX4hrSlaCj1rrLCbXUM3kmXkkB7GaQ-g>
    <xmx:UrnaZOiZ2qAkCimr9CCkmxToZ4ESa8SwARarCu7iPxMAqtE-U4_V1Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Aug 2023 19:31:27 -0400 (EDT)
Date:   Tue, 15 Aug 2023 09:31:36 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Richard Z <rz@linux-m68k.org>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
Message-ID: <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com> <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com> <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Mon, 14 Aug 2023, Richard Z wrote:

> 
> Well ideally it would be a per-device option. This would help the ide SD 
> cards greatly and people could byte swap their devices one at a time.
> 

Would a byte-swapping IDE cable help, e.g. if the same flash memory card 
was moved from an IDE interface to a SCSI interface (on the same Q40)?

Perhaps we should not worry too much about unusual use-cases during what 
would be a temporary transition period...

> Think of it, if you want to boot an older kernel you don't want to 
> byteswap your whole hard disk back and forth every time when testing an 
> older or newer kernel.

Probably not an issue for end-users, as they are more likely to boot an 
old userland together with an old kernel. But potentially an issue for 
kernel developers who need to mix new kernels with old userland. However, 
kernel developers can use out-of-tree code to help with their testing, as 
usual.
