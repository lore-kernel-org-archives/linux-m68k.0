Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A1DC77B73
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 07:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjDWHnO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 03:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjDWHnN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 03:43:13 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3CB2700
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 00:42:38 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A18F7320046F;
        Sun, 23 Apr 2023 03:42:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 23 Apr 2023 03:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682235753; x=1682322153; bh=jrINGtBppGfrZ
        TXJgfsMCJNqXj2Xg9iOIGMz/G34GUk=; b=fl6H2L1+opbHDU4qLD92Hq8cjDcBE
        yie5RhERt7qtXZQd/oeY10fAXW3JvrQK9ZkBviILYkvMsM5AUa6IgYtoZzcRJSzI
        Bgjbs+CM4k+25GESBgcsxCAvBqV1pGlMxoWYuc6exw0/0x8l+dJc08dUxG+Y4Ux2
        QRcWIbzHj/GDQzvkuyQRgYdy0TOp83tyz+PQBjQthvRq7rHV+XBdFGywPxMr1Anm
        2w4ZYUju7krMk0+uAo4QuoeX3BWMugkzACJfP1vKUkjCnGEJ90MMSVcjjCr5X4yo
        F+zOwme8DEgWhvBMCj9nOMXdX6zNBzoWUq/xyteydLYpbe8H11VKbd9Jw==
X-ME-Sender: <xms:aOFEZLJawLfpp84-pRwLD7MbZAXzT2jnOpwh9LVQB5PAkJeSHZGanQ>
    <xme:aOFEZPKlcE6Ad_YsoyARjz9wWbQAkbh9OqU5hNqgmg6Za906MtHW7iNCr3-ms5zJG
    NSwOof4ITrDdZMpG44>
X-ME-Received: <xmr:aOFEZDtshmm1aXr4ebi2veQofOv8ynV00DaIPgLCrvII6LyUHX-jRQpBfGdcqPcXiXtW6vjRtHDdxU6rSwsKQus2NLaUA-pI3Vk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:aOFEZEaDwOhllJwplepcWjQVcdCJYcX_LH5yC9iEZ-s15uTLW1_Tww>
    <xmx:aOFEZCaNtATO0Vd232QF4zLhplzRw60R1V0lmP87JWU1cxlrAOQXMA>
    <xmx:aOFEZIDZnsul9xUy5fQ4oIhuLh-EHRwUipghULtcik3OdCD9LAP5gA>
    <xmx:aeFEZLC1YIndCUyhf6AIDS_MBbxqiENSw52FstTbS7wTmyA0s232SQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Apr 2023 03:42:30 -0400 (EDT)
Date:   Sun, 23 Apr 2023 17:46:07 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <f8a79839-ab95-be2d-65fa-5cc99ec9f308@gmail.com>
Message-ID: <535b4775-696e-2524-8dfe-2943c3f7750a@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <3292e840-0ecd-1f03-5d7f-462347e161c9@linux-m68k.org> <f8a79839-ab95-be2d-65fa-5cc99ec9f308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 19 Apr 2023, Michael Schmitz wrote:

> > I wonder what we'd see if we patched the kernel to log every user data 
> > write fault caused by a MOVEM instruction. I'll try to code that up.
> 
> If these instructions did always cause stack corruption on 030, I think 
> we would have noticed long ago?
> 

I think it probably was noticed long ago, in the form of rare userland 
crashes on 68030. But it was probably never reported because the actual 
culprit is too distant from the symptoms.

But I take your point -- signal delivery seems to be crucial. Would it be 
difficult to skip signal delivery following a bus error? Perhaps there's 
no need to try that experiment, as we know what would happen.

I will take a look at your modified test program and try to use the output 
to figure out the stack gymnastics.

IIUC, there are two RTEs following the page fault. The first one runs the 
signal handler, the second one resumes the MOVEM that faulted. Maybe we'll 
have to intercept the latter (at do_sigreturn() perhaps?) and examine that 
exception frame.
