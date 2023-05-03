Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B258C77B7F
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 03:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjECDTL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 23:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjECDTK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 23:19:10 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD94AD
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 20:19:09 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id ACF5C3200ABD;
        Tue,  2 May 2023 23:19:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 02 May 2023 23:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683083945; x=1683170345; bh=1xuRqt0E1IYdH
        NguXT2Vri0+/h3foztTYciv5vcH6XY=; b=JDxYntS95aFHSVGqt1ZpJ4gIhUxsS
        rEjXN2ak4spFfyUS3jnvpg7Y2oOilAQR1LwCOkN1+iO/RHd1LwY/5cs3jXEUstk4
        2Kq3OGPnTjphdsLv/VK6U2Dljpg4rwcHmGcJ8UTdLPNiOSr9ewOxMLjp4lQDwuhu
        fHvyfbChAyEXnE7hU7jzJ+ccsLhL1aVZHMtDKnseUUs2CAzb3VxRvZYAOv+FhBgI
        7QrLb6GHej3bg4p7thSX4L9xe7R08z50qDhY7TyG0ZCZu3HCkBlIWnd0hySefT+j
        +7lfGqnqurtSJCKxAq/F7tcDsMJ80bLVEH8P8lOcqlHqKtnBT4oWNXpdg==
X-ME-Sender: <xms:qNJRZEY5yHAbyE1h46_eGUMsbImmqoUQCXio5Ulo4qPNRJkra8VSIA>
    <xme:qNJRZPZiM7H8iPpGzsztZmUe548RAO0xaOgTldV8dqtAyr-o1XJMYIQ886Ue6t-qX
    hZfXiBaYUkp-0a3GWk>
X-ME-Received: <xmr:qNJRZO9-8iPJ4o6n25PlxGpQhVS4YigKwZypyu8yX5BGirxa7-yolIyNEpKp7s-DOWN7pThoJwrvmbTvGRoFMIrGFpQQYOVw7E0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvjedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:qNJRZOoxgrcdUfUrJjLPSztB8xpJp_8Pj-6F6QqrVzbgzM_37fZM3A>
    <xmx:qNJRZPpAQ0cYD7x5lvv4kNCK9lHSSPpCxVVKp70uqMolmvZe7b0c-w>
    <xmx:qNJRZMTiYffUoo9ZKL6pd0HPdGRqFwZQAxxjMTO9czEiKSaiBpAkgA>
    <xmx:qdJRZIDQ8SwlKH55COOwIjJRHsT3zCGvkj0fHN9IU0gHflb_HGh3vA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 23:19:03 -0400 (EDT)
Date:   Wed, 3 May 2023 13:22:56 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RFC 1/2] m68k: Don't deliver signals except at instruction
 boundary
In-Reply-To: <87v8havfq2.fsf@igel.home>
Message-ID: <c68e7985-924c-fdb9-009d-0719b02befe1@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org> <87v8havfq2.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 2 May 2023, Andreas Schwab wrote:

> On Mai 02 2023, Finn Thain wrote:
> 
> > From: Andreas Schwab <schwab@linux-m68k.org>
> >
> > Signal delivery should only happen at insn boundaries, but due to the 
> > way the 030 handles return from bus error exceptions (the insn is 
> > resumed, not restarted like on the 040/060) the kernel may do it in 
> > the middle of the faulting insn.
> 
> I don't think this will work properly when the address cannot be 
> resolved.  The bus error exception will just be raised again 
> immediately.
> 

Sorry, I don't follow. Did you mean to say this patch doesn't work 
properly when the bus error cannot be resolved? Is that because the user 
space signal handler is supposed to fix things up so that the bus error 
can then be resolved??
