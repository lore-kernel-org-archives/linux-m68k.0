Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342D6C77B75
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 04:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjECEIF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 May 2023 00:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjECEIE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 May 2023 00:08:04 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC281A6
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 21:08:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5DB7D3200B52;
        Wed,  3 May 2023 00:08:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 May 2023 00:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683086881; x=1683173281; bh=K/z7Z004DMWAW
        rOmcpvTrCxoHf7ZQa3UhUCxq+N7QGM=; b=UUjDoSOw9UNRnYGS3v8HbS9rrxv7p
        Wa4XltMgH8sva/Jii7bJKR+yYYFYFqpsNIdYHFpz16iMyY8d+lmWeDW+6B8gyCqL
        aAFadl499Qz2Ytbhox0MUvNVQizBR89ukAszVozUdZMpiqSFcc++dXz8O9G5KZcx
        7NNlqJpPJvKZdVMoExu0NaU/FwYNh3/zlBa1Phn9OeGT7rlgSNuwRwhwYh33TY6j
        a3EritiMbphje5CQqvTuxrlLtBuXWJsM8ZowWvZijCxEjz8d6o+nqPW/plobZVwX
        TANVVBXlGEMC+W26gobJWtkQijh0uXMWatOFvEAswWuMikcjDm5cM12jQ==
X-ME-Sender: <xms:Id5RZEtctK-IZAFqlP-QwRsGOF9ZWHFLNUKMQZGyYMnlwJa9RU8N6w>
    <xme:Id5RZBfK0EE9l64msk3j4FQ78nlRavgyDprsAq7kx4V5dxR95fmq2gSd8Sk2qiJjC
    SxgXyAIOT9ptLMMAB4>
X-ME-Received: <xmr:Id5RZPwNC9KzN2XnNPn9Bc9A35fVkP6t8UxiOiUa-k-Cb4e-FhZRjsEMCY21v9f-wP3hatRN9gDm30rxWZGX_x8LA6CLeRBjfGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvjedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeeuveduudeuhfdvvddvudeftdduteevgffggfevgeevudffveelveefjedv
    lefftdenucffohhmrghinhepnhigphdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdho
    rhhg
X-ME-Proxy: <xmx:Id5RZHPIeA7RSrHmzBTZNJsh3xtS7hQKN4Hn6A0-jwQrlJLCA4Ko_A>
    <xmx:Id5RZE9vzG0G1mKb2HmwIQQQglEgFkKzsLIRtFcgd0cPTKf8fkwHRw>
    <xmx:Id5RZPX6xgt5TFLFqOWSu2h57JPHVkK-YkE5v7AO3osFNjJ5_cvy5w>
    <xmx:Id5RZClPB2Meg8JYK9U_rYRSJA_cFJsJWCT7cOaX5OpHq12Elki9pg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 May 2023 00:07:59 -0400 (EDT)
Date:   Wed, 3 May 2023 14:11:52 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <f4280683-9044-3858-3262-16080e584c96@gmail.com>
Message-ID: <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 3 May 2023, Michael Schmitz wrote:

> So the case that you are concerned about here is where the instruction 
> in execution is e.g. a moveml using USP as one of the data addresses 
> (making USP unreliable) and the instruction faulting is one of the next 
> ones being decoded. [...]

Right. The instruction in execution may be an incomplete stack operation 
like MOVEM. If the signal handler fixes up the address error, that stack 
operation might be resumed after sys_sigreturn(), like the bus error case.
The kernel allows the exception frame to fixed up by the user program.

> (You mentioned cpBcc or cpDBcc instructions in another mail - where did 
> you find that? It's not mentioned in my copy of the 030 UM...)
> 

It's in the 3rd edition (1990), section 10.5.2.8.
https://www.nxp.com/files-static/32bit/doc/ref_manual/MC68030UM-P1.pdf
https://www.nxp.com/files-static/32bit/doc/ref_manual/MC68030UM-P2.pdf

> I'm not trying to say this all isn't necessary for address errors. I'm 
> just trying to understand why it is.
> 

I haven't yet tried to write code to demonstrate the theoretical address 
error issue but I can attempt that if need be. However, such code would be 
moot if this patch is going to be required anyway, just to fix the bus 
error case...
