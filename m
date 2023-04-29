Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84553C77B61
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 00:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjD2Atx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Apr 2023 20:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjD2Atx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Apr 2023 20:49:53 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5161FDC
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 17:49:52 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A66C63200956;
        Fri, 28 Apr 2023 20:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 28 Apr 2023 20:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682729391; x=1682815791; bh=ANsUTuPXsQx2v
        XOJS4WqMXvaMGLu1u2zXz2puvfTLDo=; b=R86PZANaJ55AUqyaa0zvIjo2Tn+g5
        f5MGHgQKypeSoSsLsMw82fgs519iRQPUKLeOdDfnnDOGh/qxARH/N9Mpa9y1BAuc
        5I7i71wILg53LGcyng4OM1FDzA+ECYe7R2uh/ZK0oDay8fGOuvJkVhMjZGmKgWYt
        6GygxvF3W7/NAlnLxXMltmQ3XN1TRaj7mUwO14TRDbvZujt5NhpvXtyFwY2LqVrD
        0wKSKZAIhYZiPyOuhxvlV8Xnm25UvBkrSs7jFfIOH0LYPubjx70AKvEb1pc3mXkq
        2PxP2qyDk00/sMu8BbH4j2bxglFkQ7c0THV4OHNGU1KRo84qbs8dqfImQ==
X-ME-Sender: <xms:r2lMZCqNtpiC7eLcMr_BAiYGARhbt6wGlpXvKZL4IdhPZeDnyLXjlw>
    <xme:r2lMZArzO9_U5YF34hprO-k7l2HTys8bHmPFaeEMj4Q6_k11Wfyz2AK0ba4nY_E0O
    llSSNBhQSlyt008BNc>
X-ME-Received: <xmr:r2lMZHPPeZkFi2m_DrCj7GdwQtpXLKVwojzV0q63Q3-FvRbqAnPApKnhc2jR8dAES1z_zxiLpIEa7Rw9oLiG7w08zEr3u0fYpf4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:r2lMZB4SJgbSyr_LvpjHuJx157KE8lrn2p1N2Uc1i-hOuug176DyiQ>
    <xmx:r2lMZB5vaMa8G2MoVTWZTBQ65awYS1zGaOfHj5hdUsDR5uG3dXdxyQ>
    <xmx:r2lMZBjg2kIMqsImK39aihBXkcLFxmFB7UuAx8Z5wwcF9AKsCGhqAw>
    <xmx:r2lMZCW948inWK1cCC5Z7Pzzp7Yj29NYIxdf_wux6w4BoQCQuNswsA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Apr 2023 20:49:49 -0400 (EDT)
Date:   Sat, 29 Apr 2023 10:53:37 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
Message-ID: <98600751-9164-e070-ca1b-bda5b6597647@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com> <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com> <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org>
 <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com> <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com> <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com> <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org> <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org>
 <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com> <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com> <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sat, 29 Apr 2023, Finn Thain wrote:

> efffefc0:	0eee0709	fmtb.int1, ssw
> efffefc4:	24798004	fmtb.isc, isb
> efffefc8:	efffeffc	fmtb.daddr
> efffefcc:	efffeff8	fmtb.int2
> efffefd0:	d1d2d3d4	fmtb.dobuf
> efffefd4:	48e7383c	fmtb.int3
> efffefd8:	80000394	fmtb.int3
> efffefdc:	80000392	fmtb.baddr
> efffefe0:	80000390	fmtb.int4
> efffefe4:	000007a7	fmtb.dibuf
> efffefe8:	383cff0d	fmtb.int5
> efffefec:	000ff153	fmtb.int5, ver, int6
> efffeff0:	383c2479	fmtb.int7
> efffeff4:	8007b4e0	fmtb.int7
> efffeff8:	0000383c	fmtb.int7
> efffeffc:	00000000	fmtb.int7
> effff000: *	80100000	fmtb.int7
> effff004: *	800003f8	fmtb.int7
> effff008: *	000000e0	fmtb.int7
> effff00c: *	014ed500	fmtb.int7
> effff010: *	effffcc4	fmtb.int7
> effff014:	c1c2c3c4	user stack
> effff018:	effff03c	user stack
> effff01c:	800003f8	user stack
> effff020:	d1d2d3d4	user stack
> effff024:	e1e2e3e4	user stack
> effff028:	f1f2f3f4	user stack
> effff02c:	91929394	user stack
> effff030:	a1a2a3a4	user stack
> effff034:	b1b2b3b4	user stack
> effff038:	c1c2c3c4	user stack
> effff03c:	effff060	user stack
> 
> The portion marked with an * is the part that damages the user stack, as 
> these locations are all higher than USP. 

Well, the nominal "USP" is 0xeffff014. But at this point MOVEM had already 
used up 5 long words below that, and will use up 2 more once resumed. So 
the real USP is 0xefffeff8 (which is found in fmtb.int2, FWIW).
