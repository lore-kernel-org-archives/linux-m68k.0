Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764AFEE499B
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Aug 2023 23:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242907AbjHRXxU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Aug 2023 19:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242905AbjHRXxC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Aug 2023 19:53:02 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54903A9F
        for <linux-m68k@vger.kernel.org>; Fri, 18 Aug 2023 16:53:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id DF34E3200929;
        Fri, 18 Aug 2023 19:52:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 18 Aug 2023 19:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692402779; x=1692489179; bh=bVBMT4EWXz9WX
        Jq6vSohcsfErBnlOzYQ/ShLlGqx/m8=; b=zOXhNLAyW/iMtJSkY0BnbIQ2uuWie
        cAYt4jty4puxxZhwMBvKpqz1yQP1i5/bw37mVSmgOC8vmCdv8ioWOte+Ogr3ZuZQ
        aXLW38yoXDQsYMlBnZbhrrxt69VKyAXqKLFdfyieqNq5VE92CQcYpKrdcjC6KNyC
        oOkhFq9KyDHZUEgCfu8D/ZD5dkr3CtooArnBRtxf9jpFAzfN+1DjG6SL/moZgK6n
        47c0C8YX+/ArkiOY3b7irNQ86+s40FriJx4BBs0cq4Ya1ht9GWWfQM6bc2vIyUjT
        SPhxYtv17iQSpk5UMnYnnWEXciO7ostJXQSoQnwWy6XHdMkZCV5HYWXUA==
X-ME-Sender: <xms:WwTgZBwE23Vk65Fo6qn-FuYV0SjVTevPROH5TWXUJh0O_ddGhdjmjg>
    <xme:WwTgZBQEuE3Ip--lER6EL2xJHj3BiZTHfUQ42VIhO3sXp3IRRaA1LFUXm1yn5jq0e
    YzVtmtcWxfN_Jke51E>
X-ME-Received: <xmr:WwTgZLUM1Hz1gxEVutkgtt5i1rsqaJp8LChK29BmT-HW_6nRsKowQp8hJOy97olJje6m-T3TTxhwFOfCfD7zLYGD9p9HQuQigqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:WwTgZDhzc5swbb4NfvKqRTRgMKCVgOpDRERG0IYM-xqSFLw2nxoJFQ>
    <xmx:WwTgZDAjkO2psvHbZKiTeTMrUVka0W4dbyhwdJHuVRWuG2tfG7atjQ>
    <xmx:WwTgZMK3IjdkoJfAkyPUKJk5aePK_i8nFFfAkIewGNG7jJPo_LvHAQ>
    <xmx:WwTgZGNmKsgw3DQNxBJJFLPoK_Tghy-Li3hV6Mt3xEVwThX6h8D2gQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Aug 2023 19:52:57 -0400 (EDT)
Date:   Sat, 19 Aug 2023 09:53:13 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Michael Schmitz <schmitzmic@gmail.com>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
In-Reply-To: <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com>
Message-ID: <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org>
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com> <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com> <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
 <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com> <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 18 Aug 2023, Geert Uytterhoeven wrote:

> Of course 0 also works, but causes ".0" to be appended to the platform 
> device's name, visible in e.g. /sys/bus/platform/devices/.
> 

That seems desirable to me.
