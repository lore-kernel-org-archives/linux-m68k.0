Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41642C77B73
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Apr 2023 09:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjD3JU6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 30 Apr 2023 05:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjD3JU5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Apr 2023 05:20:57 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C641BD5
        for <linux-m68k@vger.kernel.org>; Sun, 30 Apr 2023 02:20:55 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 926C35C0070;
        Sun, 30 Apr 2023 05:20:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 30 Apr 2023 05:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682846453; x=1682932853; bh=tkqfM5fYrgEdE
        qx5ghb2+h8BvYi4qIDT51ZPdBEolUE=; b=kMZFWWgYdVPtKi6m3dqrObf1sBVBQ
        uQFEt8rPwMhqcVl10xDySUhKE3ahjRiaZldcqPvdr/Hx50HdUg91ECo4BWiVyKkz
        awNChsKOaci17dCJerDRmd6YwFO6ZswNpmN/j7gB+XgXB6DrgzP/7QB69z1aGDGm
        T6Z9aHQAp1TQgpp75MWCS6PKcLPWES0AOHbaWkcQ7S0L3xElI4jonn0R+B3WvhHO
        TUJ6poD5XeXyJRly7vHbzZvzuK+kovK12nI3VF/ORKcAYhRaHbMjEEz3rqqSnXHG
        68ePivCqB8cFiWPdjcYEvOXvA+kxanRyn8yP1Opwu35lrkbcjoUtzxAEQ==
X-ME-Sender: <xms:9TJOZP8A1D3YRvbI7_tA4nhmMiXQiqCAYu3OEI7JyHKwb6-TtFKz5g>
    <xme:9TJOZLuiMyFQ-gb23fhK_cO1wtwbJOvdSFq5kwf0PwC4ZPptndt-OzT5gqUkdqqMU
    ZH7RpiS1MLBp2Zb1bI>
X-ME-Received: <xmr:9TJOZNCj9KwDdR5IlgDlOJjs1Px_C2Tjhj5WNDv9Z-AaY7f2SqJuaDiRe2GZ5n7fTmxtRv7ROHy9OsvHKinQBRDjh7jAbVid2Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvvddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:9TJOZLcL-hfdufF8mLQtdEniOSzIfmTUVv2f__b--7RXLcON7Ro-Mg>
    <xmx:9TJOZEMr9ZaSoYV442a4bO8FLD0Rd3CEl8_xdceZUqXGsCR5yVg3NQ>
    <xmx:9TJOZNk57AcyQjiuqQW9lbi96C7TcU2FjcHW27mbJt4SMESV6gSULw>
    <xmx:9TJOZNY981U-VHuw2Ux_uthB5zskekkZ7uAnRZSuza2k7TMZlEKSNA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Apr 2023 05:20:50 -0400 (EDT)
Date:   Sun, 30 Apr 2023 19:24:40 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
In-Reply-To: <2458d3f7-4ad9-d4eb-4bf2-034ce8e3a94c@gmail.com>
Message-ID: <bf82f602-24b8-7b8d-899c-90dc55c910e0@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com> <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org> <10ace434-8b76-bd38-5570-9befc9eb7b98@gmail.com> <0827b987-134d-b463-c3c9-e21905f94e09@linux-m68k.org>
 <2458d3f7-4ad9-d4eb-4bf2-034ce8e3a94c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sun, 30 Apr 2023, Michael Schmitz wrote:

> 
> A fixed offset, or skipping signal delivery entirely is much the easiest 
> solution for now.
> 

I agree -- if address errors don't produce an unreliable USP then skipping 
signal delivery on bus errors seems like the best solution (given that RAM 
is so limited).
