Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83A7C7EE21
	for <linux-m68k@archiver.kernel.org>; Fri,  5 May 2023 03:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjEEDKh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 May 2023 23:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjEEDKd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 4 May 2023 23:10:33 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9371384D
        for <linux-m68k@lists.linux-m68k.org>; Thu,  4 May 2023 20:10:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 3F1D15C0281;
        Thu,  4 May 2023 23:10:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 04 May 2023 23:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683256227; x=1683342627; bh=/E2ye936NGvFU
        aY0lUK2qsFidLcYTgB9OmkR4HmUqXc=; b=MzdupAgNJ/IfLe9gJUcjWMjDEzUJq
        Q5K7JiYMHRTueiVPtbWitqaLnWuBwd9vqtBUlvWCtQUN/YaHDHgTP7VI+f7aWsTx
        7TS5yZqsI/X9Yf5khnbe5uYc+nejpaJPtANHVebTWvE5TAMPh74+WMlQA0rkmRAA
        w3K6MOhAkNnq0u4nDHR1MXJh+/qkvrZRWKU2nkhWrQPmgap0hCmRb4gwqd1Rjj4z
        ogPdiYroxcdPvUq/V3zHsSL92QfF3lvlx5XAzoXF54ULLX0D5tVGUvYhY1VH+3Ju
        3b9iHn0pRQsoAhSdQIzEZKCRFpS7KhRV0nVzo+UgxEi1F2WruJgqWs4Iw==
X-ME-Sender: <xms:onNUZCUieAOJ6b9PWjuJcCbCpkpXF4HJp4POAvP9flPw0-7CEAHaKg>
    <xme:onNUZOnj5UDCmhP3GQAAM_6JhW_I_kOOfEAb5MfLy9zXJs6FuF46WZB9V_W75Nkg4
    EPhgDSUDXrUZ5vVibA>
X-ME-Received: <xmr:onNUZGa40UwpY7m7F1WM0vtgIiPDowEJ0e_1JGHg_uKADA1_HB7bsSLP-Amc2uY0cvWx6cy2kaLaDlCWxgS2GTfeCb6XOA1icmc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:onNUZJWT4teMOm2dywSaLuKb7fJNBAl5ecU0vMcFI1GmeTjXEZhGdQ>
    <xmx:onNUZMl4sPswjVGSh3QXGzQMeoHTGmooVy6DPMGB8chi0hksYS2x1A>
    <xmx:onNUZOef2t4fmn5pMxLds7pSOxjqkCzbBSTnknx5bJiKe3z6kyKOUw>
    <xmx:o3NUZIucvojRlVkEs9ks5cduCB5j8-KF93DYYvOzLbx72-Po_5hDHQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 May 2023 23:10:25 -0400 (EDT)
Date:   Fri, 5 May 2023 13:14:22 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com>
Message-ID: <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com> <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org> <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 5 May 2023, Michael Schmitz wrote:

> 
> In terms of fixing the bus error bug, I think we'll need to fix this 
> regression first (only first patch of yours applied):
> 

That patch came from Andreas, maybe he can comment.

> I'll try with your second patch applied as well. 

I think patch 2/2 should be tested alone since 1/2 was nak'd.
