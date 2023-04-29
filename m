Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDB7C77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 06:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjD2GBl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 02:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjD2GBk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 02:01:40 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868B61BEE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:01:39 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 5A2843200912;
        Sat, 29 Apr 2023 02:01:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 29 Apr 2023 02:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682748094; x=1682834494; bh=d3VYozVtRu7OP
        wGwgLOcdvDE3MB90CVrNY9n6vd494E=; b=Ta6Ic5jW6iybqDgLZzN1XYMxw25ca
        Q6W8B8XfFB/eS96yNXbhY6ou3CBRuzRePo1g7lX9TNq96vYSNhW6C21yE10WGzND
        nF8NosTsOBZHb8QD92g3mNzrxYofrksvO1dEIDvJ2nUTzHPbHDzGbxIw+zmtYvV5
        rtBam8QVei5bJMG88MsgLqFvGcab7eQSY9OTc6I6mS/9rgWg1UqQUr/HIyOkccxo
        uJe8/7QHfas8z95h322lOlBGlFHCGbZ0MWeJHLpOpKNiy03MtgIP68P1ul4CD6ev
        FTUSUXD2FUxW/f4YwSrNMVdhdRabyMAQKvWXwrS53OmhJZ4wuXKxOOxPg==
X-ME-Sender: <xms:vrJMZDHB1rI3UXSwKpxC5ivfWWcgmZGRWwUDuPx2wEB9iRR2OoSn6Q>
    <xme:vrJMZAVkJPZQnTywgXFI1nEho04jJp2pD_pXs_BttCgssQLRzvt1RCMVVIPnT0Seh
    BLFGlUvu1-US6B-mDI>
X-ME-Received: <xmr:vrJMZFJsVwEngSGNPmAA3mJRBOFSFp7gSUAuOkfN_AW6wRBmkRDlOt_G1_zWmUIaDQByMa1N02D4hE06gJiOYBR6MflvjNIkUOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:vrJMZBE3Blqd7MTe7npVFHm2KmeUZMF4KtSZBRK6L8GR9LfFUGB_dw>
    <xmx:vrJMZJV8DqiLVCR5UrTwE08Aof_5yj3fhOpo1VbguqUJ1uKzupGtvw>
    <xmx:vrJMZMOFWyIqZ-fYivDRQydJIDEzVLFLCw0eodLT-ervib8inMy2Rw>
    <xmx:vrJMZIAyTVTNVYeBxh-U6_r-8JTxzcNQNt6h49Y5BXkE2Mux8Tq4Xg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 02:01:32 -0400 (EDT)
Date:   Sat, 29 Apr 2023 16:05:19 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
Message-ID: <5a0e853f-6b7b-b552-4e09-b7179ae6f202@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com> <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com> <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org> <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com> <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com>
 <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com> <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org> <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org> <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com> <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
 <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org> <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com> <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 29 Apr 2023, Finn Thain wrote:

> 
> Anyway, I agree that stkadj would need to account for the gap, as you 
> pointed out earlier.
> 

OTOH, there is no allowance made for the gap already created here due to 
masking off the least significant bits of the address:

static inline void __user *
get_sigframe(struct ksignal *ksig, size_t frame_size)
{
        unsigned long usp = sigsp(rdusp(), ksig);

        return (void __user *)((usp - frame_size) & -8UL);
}

Is that a bug? Shouldn't that gap be added to stkadj?
