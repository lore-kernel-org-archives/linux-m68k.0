Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0312DEE4993
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Aug 2023 11:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjHULH5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Aug 2023 07:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjHULH4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2023 07:07:56 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E7DC2
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 04:07:54 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 374675C1E54;
        Mon, 21 Aug 2023 07:07:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 21 Aug 2023 07:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-id:content-type
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1692616072; x=
        1692702472; bh=9/It3pf2qUOojkEv+BhvW+sKBwzyNIS9tCrmYMA2gpM=; b=Q
        xYygZzRcau8HH83UPJlPEPaxrSZPgObEaQpSfrM3OP7sQ8NQLi1iQgPiAF5lCUoI
        bEC9eizCLgyK/RfillFFBntKkMGf+sMlXWtrqodbJvRearvnhNXWeOFKc/mMcTRO
        STn18sxn+9vXduakzsazvAAUnX+MF74TvAjUKIP3AgZpjaRJpkz29clTOs2+cAKn
        9p7deiLYyvOxgFV/5QPcN0YrBwfyzEKDxzxdbglYPmXj3O5RTYKvAQT56fCjnd1m
        eXCeFnzbbvXIrXGHzAh+8ReBr0G1WEMEfGogYywoJTx9Btade7rWuZGvCe2N/tAi
        YXkU/BCZm//OzT01qfs2g==
X-ME-Sender: <xms:h0XjZHZk2FZB1LKFhqxhOh-Yo1b5pgYSAOmEK3Gy_HnKGv6uQ7TJkQ>
    <xme:h0XjZGbmIp07UyEKRpDEvNQ_BJh4vufRKXCM3u1qoxLvO8Qy5gOwnc-gJMjx273k5
    _2Ig0l0SPyQEl2U31E>
X-ME-Received: <xmr:h0XjZJ8VRBT4CFR0vRymxGPY1sw-NkuBc1WhOUdOwhX_SXTasT0yIJi2xvWc3bdS0rH5Gx5crq7heRjmsBd-e4YYaJADkVNftC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduledgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:h0XjZNp64eHZahUPDGb4VO53PRW5lnUJ8Z9373Bo5oreTmzq_TZCeQ>
    <xmx:h0XjZCrvnErl_BReEyZ7elLO3VnFb2v7NQrRvzyxNlncF3SbSPMc8w>
    <xmx:h0XjZDQtUCssAoEcjMeTTVOmA1wnXGf0eFJ32Q4mBV66lpb3l8LKrA>
    <xmx:iEXjZJ33onqAHL20P84_f37aNA4AByYfhiKwTZY14vj30BaNKbq0SQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Aug 2023 07:07:48 -0400 (EDT)
Date:   Mon, 21 Aug 2023 21:08:06 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Michael Schmitz <schmitzmic@gmail.com>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
In-Reply-To: <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
Message-ID: <c193a0b9-efff-d0d5-c462-5853e104cf7f@linux-m68k.org>
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com> <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com> <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
 <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com> <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com> <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org> <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-477020910-1692615036=:2912"
Content-ID: <a57aa822-e01f-16f1-2e14-518a24cd4cb7@nippy.intranet>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-477020910-1692615036=:2912
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6d05a66d-d57c-3137-d484-18d85398c7f9@nippy.intranet>

On Mon, 21 Aug 2023, Geert Uytterhoeven wrote:

> On Sat, Aug 19, 2023 at 1:53=E2=80=AFAM Finn Thain <fthain@linux-m68k.org=
> wrote:
> > On Fri, 18 Aug 2023, Geert Uytterhoeven wrote:
> > > Of course 0 also works, but causes ".0" to be appended to the platfor=
m
> > > device's name, visible in e.g. /sys/bus/platform/devices/.
> >
> > That seems desirable to me.
>=20
> Why would it be desirable?
> IMHO this is an unneeded change which is visible in userspace.
>=20

Only so what's visible in userspace would be consistent across atari and=20
q40 (and anything else that happens to instantiate the device in future).=
=20

Basically, I don't really understand why id -1 is better than id 0. I've=20
searched Documentation/device-tree and I still don't understand why a=20
singleton would need a special bus id.
---1463811774-477020910-1692615036=:2912--
