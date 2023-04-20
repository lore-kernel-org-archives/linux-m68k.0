Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31219C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 05:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjDTFpP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 01:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjDTFpO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 01:45:14 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F5A3A90
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 22:45:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 6186A5C0226;
        Thu, 20 Apr 2023 01:45:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Apr 2023 01:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681969511; x=1682055911; bh=cI2Fk5LK3nwhL
        MmwcHlZTspLj9gdS9WqpyXv4T1Xo+U=; b=MsLf+TJLifogQdoNVSzg4lAvFgx15
        Fc3rXs3gRrGEoMQmEi10YiIvxzpv9B1U0aaizvbidkyV7FhsxHoSngpu1NmmUoUs
        VppFOqoBVhTYfOcHbF8w0Wa2wepgyiHTG6sYIw6ZYp6haaghTZAC2L29bUEDXQ6V
        aGajY9eBEpIbWb9B6YI4SqjTvUfhn61MVqUKD7ZkqzUFdeRQ0XpgwRhgcjeG2r+1
        6e81tSxeYN1Qy/JXhlsAtgftylxzCpQxfSexMZMYj81qk84HrcxXmQKGfehOLGR/
        8SmJYdXVSodLMNNHVRJUovMizUV9KXXVfUBckUbgxLWGvnMEJEgxbokiw==
X-ME-Sender: <xms:Z9FAZHaYS5iitUuaoBowM5Nm7GRxJDax2J0eDEzqpoLm947YwV1Cmw>
    <xme:Z9FAZGYK6OsReord6pDfXLKUezo1h_AfOUajagOJeWRGvA7OEbeNiEASRDhXB13fr
    9F778zpxg22YIvmwek>
X-ME-Received: <xmr:Z9FAZJ9pjOwmvI_2dZoEqqyTICGntJhmfsG6MGvfjFkEbzZQrzu5f4YLSl2otwe9JlkwcN7eYa2b__b-DUK_r2iBEmscuVJFz_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Z9FAZNo-JWSBepuHnb9yLjfApZqaUZLVT3I9QkKOaoVuvYHFr04SgA>
    <xmx:Z9FAZCpjj1PA-v6-2c0ceq33ZPN2SnJHWb1zz9kZO5H2kUA0sgHySg>
    <xmx:Z9FAZDSRw76gofq69NltWf1f5xUZifA3BeSMlZ4t_gPuG5fWdklmGQ>
    <xmx:Z9FAZJR7--BdUEIQTel_d0z4gdWrz8lV-vTOGlpYvBXXzs1iK0jknQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 01:45:08 -0400 (EDT)
Date:   Thu, 20 Apr 2023 15:48:42 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
Message-ID: <ce86e94a-3a6e-6cca-3e24-cc3f79a9a8fe@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com> <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, I wrote:

> 
> So it must be that a MOVEM went awry when a signal got delivered.

Or signal delivery went awry after a MOVEM got resumed?
