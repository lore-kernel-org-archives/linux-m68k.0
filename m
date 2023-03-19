Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD0DC7618A
	for <linux-m68k@archiver.kernel.org>; Sun, 19 Mar 2023 08:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjCSIby (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 19 Mar 2023 04:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCSIbx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 19 Mar 2023 04:31:53 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244EF227B8
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Mar 2023 01:31:51 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 926B03200406;
        Sun, 19 Mar 2023 04:31:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 19 Mar 2023 04:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679214707; x=1679301107; bh=DiHStp/dqb9HZ
        uxK4oJUXMdYo1wncOrQNbLFb/+qGmc=; b=tOR2XEo34Fd2I+ISokEvGN6Jp0v3f
        uE8DMsnfpOTVS7pjB/tlRbvfrCjaE1upyitsYrV0V0FMU8df7do31/SR6WbdXLzR
        W5YmykzspZOUeKW759rls5SCNyASiC90BDWgFYDIeM27Ha0Kmaf95dn//dKcH2HY
        bpeV7TU2dQj2o6SgMUfPwmcYOr8rkgqfx+W3AYWpSOs1vNu9arAMaDPbjFQQFOmN
        WDD5gY9cKdQPOtns3Dql98GpVfYFTLSjHD+VOqGVejDtURKUYu1g0bN3OLyQq4d7
        zFkyz/tIe/K0HjXVsnLPMhiodOlSWuVIa9cMs8b6bVe/O2P7f0tgVlDcA==
X-ME-Sender: <xms:csgWZBBDzs3A4ALdKRXb1F496H3J_Mzzb3Ng95YWuhmqlTZt26zBKA>
    <xme:csgWZPgJyevftKc8uvqG6IC2QFk2aTL3naZuuO0uMmXbZsxKGJtBsaK8wwLBofXFg
    MoRnAdG5aX4JxBQTI8>
X-ME-Received: <xmr:csgWZMlmjjv3C-c9ugwvwilXrSedKB7xlp2amzKHeFRNQy_t7hqFZpQMHlYJm6mo1IGSTeUA-aF0REzcnYNroT0KBg63Zf7Jp9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefhedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevufgjkfhfgggtsehttd
    ertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhu
    gidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeefieehjedvtefgiedtudethf
    ekieelhfevhefgvddtkeekvdekhefftdekvedvueenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:csgWZLzFKaDijEGIPGyvjdtS3attHL8UG2yX2jSscXrrvxHSAm47-w>
    <xmx:csgWZGTdA0ddJxYxbBmh1DTgJh55V4UV1PyUEaKRhEhZPWtggKgovQ>
    <xmx:csgWZOa3owZQuq2aCZqncUkCbA0lUzrxVeKa16yWuKQsCGyvXYz3Eg>
    <xmx:c8gWZP4zjPmyY_dXfzPPxCJiTGQZupbYSZsgQ_i6cetjt3N3z-KDfQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Mar 2023 04:31:45 -0400 (EDT)
Date:   Sun, 19 Mar 2023 19:34:36 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Lizhe <sensor1010@163.com>
cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] nubus: Remove redunant driver match function
In-Reply-To: <20230319040816.232446-1-sensor1010@163.com>
Message-ID: <3d77744b-ea67-a5bd-8126-f3d56e608add@linux-m68k.org>
References: <20230319040816.232446-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Lizhe,

On Sun, 19 Mar 2023, Lizhe wrote:

> If there is no driver match function, the driver core assumes that each
> candidate pair (driver, device)matches, see driver_match_device()
> 

As it happens, the same patch from a different author was accepted last 
week.

https://lore.kernel.org/linux-m68k/CAMuHMdXQPh0BaQA1csgJbPxjorY15-V9=jb7ZL8Yq24Qe7k9jQ@mail.gmail.com/T/#t
