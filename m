Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9205C6FD1D
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Apr 2023 11:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbjDDLGY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbjDDLGH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Apr 2023 07:06:07 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEA555AD
        for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Apr 2023 04:04:07 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 046BF5C0068;
        Tue,  4 Apr 2023 07:02:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 07:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680606136; x=1680692536; bh=sSo2sqnGTsVy6
        cwFguvYTeFjtXdy4pFTSD0oaCiuLyE=; b=ez/u/uRCsvbG3GgUE+Q4CSUMU/dsZ
        kcswAG4z4OlZSvGgkvVURohXyo2lqnqmKdjyoWuAY/LizjmTVUVv9GC9siHdlM+w
        8dfBuRYD6nkj8VpYTQakmn38E71H9L6sW1C9SL+3lUgx44cPyIYnm4K6UELj+wSU
        olM0Ugxn7GKhe+OVtZpyv95SIu6hymxxdPwY3T0wjXve4S46GFUzDoPq1Pa4h9Gn
        ATegS6f1ckdK5M/Tusw3BXoj/rRELAVtRWZ8xlIYZAOHg7vWRXfJ6mpMnYJ9XVzR
        s4S3eIjZT5l6dWOoy7PODoqQcokcz/A1nK3r8hCH5v6mhksFzrR9pbv3w==
X-ME-Sender: <xms:twMsZMAMItEG8bTEr-rG49zdiAXBd12efpUTd8hY5tom9Obxedf8sA>
    <xme:twMsZOgJ6isR6taNyfZqkbLwrKZfC8BfbQ4_nWN5XwrtGHPx607ofGGDlkBKP09tM
    s9EqWUhxf_07mZPeqs>
X-ME-Received: <xmr:twMsZPn_zEA7n-AmzDnVhwX_AhgNAOfOqWP7waQqt3oJGKGC2aXmz6njxheK5wwEUETRYia_PIr5Cci-wOFzxEITjFF5DTG1tTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:twMsZCwfsvECih8sKaD7L7JYxvVXr1SYZ5PUd_jsQBcL4C4O0zPjVw>
    <xmx:twMsZBSSrBEhMDlHhmp2tze-3IH9aWKRRuMvE7fAe_17lgUl2t23WA>
    <xmx:twMsZNbGDhWZrJfIacFjnJ89YVuKC67X5VVmNd6N-Zd-PcUk6l-dVQ>
    <xmx:uAMsZC7DsnulNSUcoS2rpgNoGXG8Ea6d32eoPTDFbtNRp655H5i_UA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 07:02:14 -0400 (EDT)
Date:   Tue, 4 Apr 2023 21:05:22 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <69f70488-b84d-7c24-d001-529896f3bd34@linux-m68k.org>
Message-ID: <e51458c8-353d-c339-5e3e-d4feb5d0da36@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com>
 <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org> <d6bdf882-9470-4d05-bd3c-36a1f3410fc1@gmail.com> <69f70488-b84d-7c24-d001-529896f3bd34@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 4 Apr 2023, I wrote:

> 
> The actual corruption might offer a clue here. I believe the saved %a3 
> was clobbered with the value 0xefee1068 which seems to be a pointer into 
> some stack frame that would have come into existence shortly after 
> __GI___wait4_time64 was called.

Wrong... it is a pointer to the location below the __wait3 stack frame.

(gdb) info frame
Stack level 8, frame at 0xefee10e0:
 pc = 0xc00e0172 in __wait3 (../sysdeps/unix/sysv/linux/wait3.c:41); 
    saved pc = 0xd000c38e
 called by frame at 0xefee11dc, caller of frame at 0xefee106c
 source language c.
 Arglist at 0xefee10d8, args: stat_loc=<optimized out>, 
    options=<optimized out>, usage=<optimized out>
 Locals at 0xefee10d8, Previous frame's sp is 0xefee10e0
 Saved registers:
  a2 at 0xefee106c, a3 at 0xefee1070, a5 at 0xefee1074, fp at 0xefee10d8,
  pc at 0xefee10dc

That shows %a2 was saved at 0xefee106c, and the address of interest is the 
stack location immediately below that. But it has no particular 
significance: it holds a NULL pointer when the struct __rusage64 *usage 
argument to __wait4_time64() gets pushed there:

   0xc00e8152 <__wait3+226>:   clrl %sp@-
   0xc00e8154 <__wait3+228>:   movel %fp@(12),%sp@-
   0xc00e8158 <__wait3+232>:   movel %d0,%sp@-
   0xc00e815a <__wait3+234>:   pea 0xffffffff
   0xc00e815e <__wait3+238>:   bsrl 0xc00e8174 <__GI___wait4_time64>

But it's no longer a NULL pointer at the time of the crash, though it 
should be, since that stack frame is still active.

(gdb) x/16z 0xefee1068
0xefee1068:     0xc00e0172      0xd001e718      0xd001e498      0xd001b874
0xefee1078:     0x00170700      0x00170700      0x00170700      0x00005360
0xefee1088:     0x0000e920      0x00000006      0x00002000      0x00000002
0xefee1098:     0x00171f20      0x00171f20      0x00171f20      0x000000e0

Beats me.
