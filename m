Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459B7C77B72
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 06:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjDTGBW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 02:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjDTGBS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 02:01:18 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8B5558A
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 23:00:54 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id DE8BF5C00E8;
        Thu, 20 Apr 2023 02:00:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Apr 2023 02:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681970453; x=1682056853; bh=VFNE3yLOdKR06
        s4SFnYGU0pzjwAipYfI0x6NGdjED44=; b=S0Y03eBQI2rWgYvSfGv6/uAtccNK7
        +I/BDd1lfVyuPvxat8tg5/Rks9Nm9E1cDU8TBRslvfatynsa4hs/1bewQJvFhguX
        7Wdxp7OfOE0z5U9GDevvW/sfHyJVhSyvYTiedBftmoV3R6LXCfzO34RduNgCmj68
        pu2RhXACOFIVGgqzSWBLNezRUv6gg11oggfl6/VXKxZyIyabfZ6GdKemab4LO9tH
        5qzaMCUv5olh8bta8HS7Fn+t5rD2K4jLwUbTvvPeDZXN2q+wm9mA75Vc7bzYhGGA
        DGxo/bLvFL/N9ZXa7lsNXjN3cojSF/MBbU35ky/toSGQM2FDX0He8mjeA==
X-ME-Sender: <xms:FdVAZBTRnIDsgGLHgtg7smCreov_yFLigPcphkP-ubxuTOqCGBp1jA>
    <xme:FdVAZKwZAwXRoOEzjTc_djUT9mPNDwEtWTgpNlRBDhaveSklvRbaniGyoC3EaJPRR
    sm-S_gX3j-602eyRX8>
X-ME-Received: <xmr:FdVAZG3OUrXH-9sRYgzoxU1vBrbqFm8zc8j0UV6eoqWrs0f2fHIvAwpbGP6tr30puNCrz5FTFmVmyqIhBnY6vheQSAXS6bPEYSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:FdVAZJA-F7G65pFSzCleh8IZhHvWYb3tyWCkjZksUFuNFKi9M6jwCQ>
    <xmx:FdVAZKjHHhLU4Z_pORBncGAmcqL7IwwGJNsHaQmJt8G07tyPe1sQPw>
    <xmx:FdVAZNqOQp5zCt1fll0uI2XJDlrIogzigOnmneWHwanVpLqQfP2ebA>
    <xmx:FdVAZCJs8H7NBbZGNswaaGV41VQr-VS6weGU82x3gOjwBIBSEJ7h2A>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 02:00:51 -0400 (EDT)
Date:   Thu, 20 Apr 2023 16:04:23 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
Message-ID: <be49e4a9-298b-a748-399a-9a075ceca72a@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 19 Apr 2023, I wrote:

> Oddly, the program never detects any stack corruption when run on the 
> QEMU '040.
> 

I tested a Motorola '040 and got the same result.
