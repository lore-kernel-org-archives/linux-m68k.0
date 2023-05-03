Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D28C77B75
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 03:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjECDUt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 23:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjECDUs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 23:20:48 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F296AAD
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 20:20:47 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 465BF3200ABD;
        Tue,  2 May 2023 23:20:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 02 May 2023 23:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683084046; x=1683170446; bh=FbJnWlJWJTUAy
        V/7mzLigaFSTNMECRPqipgyTRJCoZI=; b=WWvAPNhqQGPBj/BYTHmmRAbEoG177
        Ak8y90mTAlEP2Mq9GFUrFzk86mtQ2UJceFgVPiUuFsqyfNOZ6nhuKaCI092Y/QOs
        LdannZRERPTdnL+iCH4w0siz0bl5CgUKRKBdiss8auntM0nHW4x7DKPaWw6ct2sQ
        hxQ9fLnCVvxTz7jeUpjQt/bijQck5+png7UDjFZVg7BMjzvqj+A/YXYBsevZtRPG
        tYSs6oMLpZDRbgtlAdt750XVoBaz+A2x9IJxJ3Z+luUKpNUZSfQBmtZa+Yp+QvHx
        Qx40p0319W80+Xo60fkiJsUUd/xxZBUjQFB5W9S5Ey0mTQ/X2LWdMTL/Q==
X-ME-Sender: <xms:DtNRZE0i8qpuEKyHY9jNdW6tmH2w9d9rXpofc8dggQzcbPLoQc2M-A>
    <xme:DtNRZPHk2wD8l4G33M0sQLRBYMZsttHeLjiKABdyVyrMzG2AIuPVHUQpdAYQbcgod
    JzJkEQKQhcAZOiJzqA>
X-ME-Received: <xmr:DtNRZM5Y3fBTAAfrDPBDAkUEYv6-7e-4qpLbZliX1WNtNnXcyfrUAZfaDWasc7bvZfjzr1Kxd9yUuwzqlnxzLk_CqrqKYgQfuII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvjedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:DtNRZN1P0zIsmdUk1ZJX7WnNtWS25x3ErgzF4yJ5UzgPvAV0_YrWZQ>
    <xmx:DtNRZHFTuf8fWroslhlqzLK4_ws_O5vY1fxIJM4kpKMiL6gHHdEyVQ>
    <xmx:DtNRZG-p8s0z3zbgVP29iyyfkstmsO_dduMMR26Pxug238UAbTg-Tw>
    <xmx:DtNRZNOZH7W_O35XRAYFB5EqdkvqjEoATswPHMYVHse8oBQcl-Rqew>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 23:20:44 -0400 (EDT)
Date:   Wed, 3 May 2023 13:24:39 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RFC 1/2] m68k: Don't deliver signals except at instruction
 boundary
In-Reply-To: <c68e7985-924c-fdb9-009d-0719b02befe1@linux-m68k.org>
Message-ID: <163137a5-b4ac-c6fc-03fd-5522d4b7c99a@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org> <87v8havfq2.fsf@igel.home> <c68e7985-924c-fdb9-009d-0719b02befe1@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Wed, 3 May 2023, Finn Thain wrote:

> On Tue, 2 May 2023, Andreas Schwab wrote:
> 
> > On Mai 02 2023, Finn Thain wrote:
> > 
> > > From: Andreas Schwab <schwab@linux-m68k.org>
> > >
> > > Signal delivery should only happen at insn boundaries, but due to the 
> > > way the 030 handles return from bus error exceptions (the insn is 
> > > resumed, not restarted like on the 040/060) the kernel may do it in 
> > > the middle of the faulting insn.
> > 
> > I don't think this will work properly when the address cannot be 
> > resolved.  The bus error exception will just be raised again 
> > immediately.
> > 
> 
> Sorry, I don't follow. Did you mean to say this patch doesn't work 
> properly when the bus error cannot be resolved? Is that because the user 
> space signal handler is supposed to fix things up so that the bus error 
> can then be resolved??
> 

Nevermind. I just read Michael's explanation.
