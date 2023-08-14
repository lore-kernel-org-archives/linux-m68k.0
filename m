Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA2EB64DD
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 01:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjHNBQL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 21:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjHNBPw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 21:15:52 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAED18B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 18:15:51 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id B8AA63200903;
        Sun, 13 Aug 2023 21:15:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 13 Aug 2023 21:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1691975747; x=1692062147; bh=EO6rsjXUkYhOw
        FNKJ9poiukGNKULy4lJ/aBtdk3jxJQ=; b=Q3JT1e3jiA7CdiSWdmDvtKEEGXIcI
        pKi7Oco7MYKx/WUeFcfHK/1Zh/IuUdiMnJ2ZD5m/d0PQpkkdm4pqOowUA1t5Wj0r
        hVO8R+uMjWxemcunSDfiZXona8Uzb3K8apsxOzzlTz8F9BASEYZ4gj77Z+/byn3t
        ru7pyE9bcr2iExpYJlSOKIbVxb3TD+/Nlqh+o0lcVIQf8aC1cp+Ug7MpGOmKxQ+o
        ncjU3DShQFsF48mNi4jHEkgD4sDWKiWt5dmN/2SQguUbGZreookqpDV5U1d4AjM5
        0D26GSJJ0sv2+bvTlz8VzAH4Zx60j7OEn3mTIhS/1/87fKImpjGWmFaTA==
X-ME-Sender: <xms:QoDZZLpxfOYQBwSjuP0iDM38wo622yx5HbTeJ4luMsUA-YT5E65xWg>
    <xme:QoDZZFqkl1xjfsTzoVDzz26UmJiZSV3eEsA3Z4ZfH6n8f2cBpQpcDLeoGnwJXVaOK
    RTa57i2anOJZFlszvo>
X-ME-Received: <xmr:QoDZZIMukjANAPaoTW2CTTCJWbn6d2WHpXA4t_aalRGVXkXsR5WNloAq591m2qc4axZhpKjVFSVtgCoabgesxqWyu_tVzJmsDpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtfedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:QoDZZO7rrsNMp1JEHma0Q1lqjLr9GnZNikZhdF0WcmLSg-60t1VGCQ>
    <xmx:QoDZZK4MHpn2w8SAc_NYsi6D_YIl8XTWEWhTMinEfW8FPM5d4Matkg>
    <xmx:QoDZZGhWfkY2fYnLzgZ4HGZJ59et_me_oR6KVIfbLriHmyNiFm7UTg>
    <xmx:Q4DZZKHBsArwA9DwakHKniiPJFqYpFvdUIAvCEtfndQPWRhmj04_Lw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Aug 2023 21:15:44 -0400 (EDT)
Date:   Mon, 14 Aug 2023 11:15:42 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <1403a5b1-7d89-9ae7-e47b-168feb148454@gmail.com>
Message-ID: <70169097-fb78-a55e-92a4-d5d777e27149@linux-m68k.org>
References: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com> <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com> <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <a1ffc79b-eb37-5ed6-6984-a0a3674662b1@linux-m68k.org> <1403a5b1-7d89-9ae7-e47b-168feb148454@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Mon, 14 Aug 2023, Michael Schmitz wrote:

> 
> Most other Falcon users might use SCSI (and SCSI-SD adapters) to 
> transport data between systems. Not an option for Q40.
> 

Well, it could be of some help inasmuchas we still support a number of ISA 
SCSI host adapters. I wonder whether the Q40 ROM, bootloader or vendor 
software etc. has any support for SCSI cards (with no byteswapping)...
