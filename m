Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2709C77B7D
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 00:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjEFAct (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 20:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjEFAcs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 20:32:48 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A78F659B
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 17:32:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id BFB533200998;
        Fri,  5 May 2023 20:32:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 20:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683333166; x=1683419566; bh=meG+p7IzHOhVc
        Bx6sY5oAosAqt4CE8nafV2lXDztBhw=; b=Z0xsZwfV92GCveg7oVbu4BWgXUTI7
        nQKspJnoe+NWqPiHi9FC753R4LUEKcLIW8n8epYvEuYaAJqltj1vkRxNnXlXVtbH
        Qu1HkUhGn9E9JAcFhDNgGeKD5Y0dptFMmYyhN69u0+9eoms2W6/x9MOijDSK0cAN
        6XgTZ8pd2dIZnHtI0WSf19NhPLuEM4GJWP0AshjM5CEZzMZc/0TkQ61ZEmErOjIc
        Tv64al5iy0q4E82QG5ay0+b714ae9UhTmBZOu/+GL0qwtr+CyA5keOk3MoauVO+u
        3MPjTr88xXjuwjdwGoBl9DYoqsntsF7AmXWtS2gW/YZitwLmPDUn55PFQ==
X-ME-Sender: <xms:LqBVZNnoGMLBpMBE0MIbfJNIMNp9cKvfGErvcbNrxqzt01DrhWRRPg>
    <xme:LqBVZI020CMThOPV00f8D1f8lK58OLpT1Fsl1zvafJP06q8k-GNtQiunv4BwkqKuZ
    tM9LXpKJgg-8pE2UcU>
X-ME-Received: <xmr:LqBVZDpABtiK-KPIizawOYa42ICF15mp3BtfWBMJTUpM0OrxEzdW9HWfhkkW_gCsfeTrWZNoRmSLYWxrUuA1NkL7BIPl-iANIY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:LqBVZNnguF7wsICXIEa8_2nUO5IhcW2dKRGWCaBhCoAvUXOsyRjyNg>
    <xmx:LqBVZL12CiHqwP_MVVjkiygDrloHjVgn8Dgeu4u2p3htH3R-Og7l1Q>
    <xmx:LqBVZMv4RFVRr0HFvpRjIlro-5yfHaotYS3LWxx7qECSk1m_k8qgVA>
    <xmx:LqBVZE_OL2skniWC4s8NDaMvde2CdZXgKRP_pnFgQ4TzyTymLn86iA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 20:32:43 -0400 (EDT)
Date:   Sat, 6 May 2023 10:36:43 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
Message-ID: <1a5a6aea-4d58-0f59-f283-694c51bb162d@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com> <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org> <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com> <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org> <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
 <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 6 May 2023, Michael Schmitz wrote:

> Am 05.05.2023 um 17:05 schrieb Michael Schmitz:
> > Am 05.05.2023 um 15:14 schrieb Finn Thain:
> >> On Fri, 5 May 2023, Michael Schmitz wrote:
> >>
> >>> In terms of fixing the bus error bug, I think we'll need to fix this 
> >>> regression first (only first patch of yours applied):
> >>>
> >>
> >> That patch came from Andreas, maybe he can comment.
> >>
> >>> I'll try with your second patch applied as well.
> >>
> >> I think patch 2/2 should be tested alone since 1/2 was nak'd.
> >
> > I'm trying to find out whether patch 2 mitigates the effect of patch 
> > 1.
> 
> It didn't - hung without printing an Oops message, on the first stress 
> iteration using the --stack 2 --stack-fill stressor.
> 

In my mind, at the time I sent them, patch 1 was expected to mitigate the 
impact of patch 2. It would have been surprising if the reverse had 
somehow happened.

Anyway, I'm still in the dark as to why patch 1 is interesting. Was that 
because you wanted to delay signal delivery to try to put more pressure on 
stack memory by delivering multiple signals? You and I did come up with an 
alternative patch for bypassing signal delivery after certain exceptions. 
Maybe that would work better.
