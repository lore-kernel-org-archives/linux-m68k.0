Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB69CC001DC
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jul 2023 07:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjGZHY1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jul 2023 03:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbjGZHXd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jul 2023 03:23:33 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627CA269E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 00:22:35 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 1C4945C010F;
        Wed, 26 Jul 2023 03:22:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 26 Jul 2023 03:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690356152; x=1690442552; bh=vWYaU3bZOqMpj
        JV/saZ8R72JDTpcZwCErkSWyotNksw=; b=YElKSmfPIbfqvCcMBRIWBMLA9GJUK
        /AqytvvVcwk9HTWBvsH2erIDxaiu12REjQO54ZDvDvJAuH/btNj7CRKAzLTDsfJC
        nokGJvCpq1l6J416Bs17CnNpo44PvHyOZhHnrbJ6VM4ZhT4gMqkKhd+Qua7ntHEP
        Nn3idZ3m2w9F6IlJzG+/YtWhN+NoMjeK7QMOmYOA8btqc3iOQ0vo0pn14hGkkjr/
        l+lp+0oi9kB82JYzDM+TaFiz/MkM2SHXkM0SIo6aX50wXdO+Vh7mSva4H9zkUFVd
        mTUcGB95GI8NbTIgdmX5mPCNruz6rEZ0DSUvChb+SNYSIONk1JQV4H7hg==
X-ME-Sender: <xms:t8nAZLwG_E0bXqgFQBtkJucbCDT-IM5mZg59QMEpBGJHKMtDLKff7Q>
    <xme:t8nAZDTioSdeM4VdiAxF477OUq8Freo562zPCgOi7C4-XTnLn2f-UeUM8oS_vM45k
    Q8bt5WK4W64a9uJS3M>
X-ME-Received: <xmr:t8nAZFVgeOi_CKka4CPBM4vCY_zcTvwVWCF4A3Q19jW7gAe0xWLIaX5eBn7--lzSGEyjHIR5s5UWNzWXxk7tip4YkjftbGTbhwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedugdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:t8nAZFjODOubEvmdcvaIgqVxdmF7S_ZOAaUG7baeMu69LTbrmX4uOQ>
    <xmx:t8nAZNCvOltX5AxZoc2y_xtJcjOlQVo_pbvHE5TmyXqBYB5g_XmvYw>
    <xmx:t8nAZOJXmIa63ED9k3Cdg97_GRHTSL1dPLMvos2a_yfoJsOtDBV6gg>
    <xmx:uMnAZApT75o6jyroCExsINlzQwzNXkJOJlY8JnVujZOTuCXTBnmDsQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 03:22:28 -0400 (EDT)
Date:   Wed, 26 Jul 2023 17:22:42 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     William R Sowerbutts <will@sowerbutts.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <ZL5b0geTJtGvDnDg@sowerbutts.com>
Message-ID: <ac188364-ab9a-7887-09fe-6f73f5e6b5dd@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <ZL1HMqBbdw+8buf+@sowerbutts.com> <37514b0b-5735-d856-b342-7797ac412e21@linux-m68k.org>
 <ZL5b0geTJtGvDnDg@sowerbutts.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Mon, 24 Jul 2023, William R Sowerbutts wrote:

> Certainly -- attached
> 

Thanks for that. I see that you're using a .config with CONFIG_ATARI 
disabled, meaning that MULTI_ISA is not in play.
