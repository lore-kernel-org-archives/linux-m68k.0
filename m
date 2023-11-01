Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B65C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Nov 2023 22:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbjKAW3p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Nov 2023 18:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbjKAW3p (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Nov 2023 18:29:45 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCF1134
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Nov 2023 15:29:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id DE9B75C0370;
        Wed,  1 Nov 2023 18:29:33 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 01 Nov 2023 18:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1698877773; x=1698964173; bh=VA
        tk4joSxz95XQTbl0nvff9mxXDCg9NALjFyJozqkec=; b=a4yNYvZISKlK3Amda/
        JPyGswNeuBXYtiQeztFVZd74cgPovoeeNT/A8r53zkhcu9w4LkMmzjDF1s+dF2Hy
        Z97YowrY8ZzygjDUtbgZnluWH6p8ceHfm0iZhol3kCq1WlBlAd2NO+6Z9rvg0jZP
        fSmF1hnufv+/sk+raaZubFg00AjJNyvw8UN6DGBkT3PXb0RXJmtHOLLra/GdA0pP
        M4AmjwMFRZbqbME/82dV+cU14uEdBUaGPcpeEUNlUki26pS4/7FlMJa3q3PiNnDX
        0/X30SZCtgT1jJ873ffVXt78dH7hZJ/79j9LKDjiQ7G6seo/fq4lNycNt6HwMhRs
        InAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1698877773; x=1698964173; bh=VAtk4joSxz95X
        QTbl0nvff9mxXDCg9NALjFyJozqkec=; b=nNgZQUqCJqcdBgOzSnniO7Mhq1FNG
        CxphAGqGqt6U1rrNjWp5Lj5T9/1OjgFkNWqH5bVpQdUcDPM7b8sv9qQTWAd0Wpo8
        1KQvukPHQG1xneggzdskFKOcY35GTLJw3hvvz4Qt6o7hqFc+xPJryDd/nPGWBNSD
        xjuqWSTDLwex62EUbuxPoFhD4/vm6NfFjyuhzizbsp3Be+T6+FsQ9AyKD9oX+Gi9
        O6aFbScl0m3ga16kbN+27XyfcMYD0Fgw+s4IWumc3eXOI7skKAf2SZZ3XL4p+7al
        uS3eMImxFwB6iGDmEpnN45iwEoC5VVdUERRO56Vri03dCIAbzLakQzTjw==
X-ME-Sender: <xms:TNFCZe8vfyNWLUyZ3RbbX9sM93Clkca5JLnboIFejYORiGymUWwjaA>
    <xme:TNFCZes-ghxlP9Hov1AMdH20WWkLV5Tb9a3u0JEQeh2jfhhSYIp6oKQwOON1jnNJo
    tNKxYShSeqYBPmjSf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeejvddvvdduleduheejiedtheehiedvjefgleelffeigfevhffhueduhfeg
    feefheenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:TNFCZUBEAOqKMLKHaVhyYyhzB3nuyxAUnsyovh2P2WgaS2XCYK-fKQ>
    <xmx:TNFCZWf7UY-MZhvwbT4zg6W8L8kHxfB1uzebwe7pzBnlhr2bjEQKmw>
    <xmx:TNFCZTNZ_v4dlv8ZhesNHXhQyBsb5zBzEgxe0bmN0luH4vw-UVaYhA>
    <xmx:TdFCZcqG2Wn-rdIAhp1Pcfj6waRQeF6PrhyPLuisLlCKD97i0B0GxA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BCA86B60089; Wed,  1 Nov 2023 18:29:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <d40cd45a-e7e3-49c4-931b-c5ec75a6bf56@app.fastmail.com>
In-Reply-To: <79b7f88e3dd6536fe69c63ed3b4cc1f2c551ce8d.camel@redhat.com>
References: <CAMuHMdWL2TnYmkt2W6=ohBuKmyof8kR3p7ZPzmXmWSGnKj9c3g@mail.gmail.com>
 <594446aaf91b282ff3cbd95953576ffd29f38dab.camel@physik.fu-berlin.de>
 <CAMuHMdWv=A6MiVwUuOp8zOCcf21HxKb8cdrndzdbAZik3VRXiw@mail.gmail.com>
 <5e3e52a48ba9cc0109a98cf4c5371c3f80c4b4cc.camel@physik.fu-berlin.de>
 <79b7f88e3dd6536fe69c63ed3b4cc1f2c551ce8d.camel@redhat.com>
Date:   Wed, 01 Nov 2023 23:29:12 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Dan Williams" <dcbw@redhat.com>,
        "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Jakub Kicinski" <kuba@kernel.org>, Netdev <netdev@vger.kernel.org>
Subject: Re: Does anyone use Appletalk?
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 1, 2023, at 21:27, Dan Williams wrote:
> On Wed, 2023-11-01 at 13:26 +0100, John Paul Adrian Glaubitz wrote:
>> Hi Geert,
>> 
>> On Wed, 2023-11-01 at 13:19 +0100, Geert Uytterhoeven wrote:
>> > > Isn't that a bit late?
>> > 
>> > It can always be reverted...
>> 
>> Sure, but I'd rather see such discussions before merging the removal
>> patch. Best would have been to reach out to the netatalk project, for
>> example and ask [1]. They just released version 3.1.18 of the
>> netatalk
>> server in October 2023.

I think you mean netatalk 2.2 for appletalk support, as the 3.x
versions only implement AFP over IP, with no localtalk/appletalk
support.

>> It's an incredibly cool project because it allows you to replace the
>> expensive Apple TimeMachine hardware with a cheap Raspberry Pi ;-).
>
> But... Time Machine debuted with 10.5 and AppleTalk got removed in
> 10.6; did the actual TimeCapsules ever support AppleTalk, or were they
> always TCP/IP-based?
>
> (also TimeMachine-capable Airport Extremes [A1354] are like $15 on
> eBay; that's cheaper than a Raspberry Pi)
>
> This patch only removes the Linux-side ipddp driver (eg MacIP) so if
> Time Capsules never supported AppleTalk, this patch is unrelated to
> TimeMachine.

If we had not removed all localtalk support already, ipddp
might have been used to bridge between a pre-ethernet mac
running macip and an IP based AFP server (netatalk or time machine).
Without localtalk support, that is not all that interesting of
course.

> What this patch *may* break is Linux as a MacIP gateway, allowing
> AppleTalk-only machines to talk TCP/IP to systems. But that's like
> what, the 128/512/Plus and PowerBook Duo/1xx? Everything else had a
> PDS/NuBus slot or onboard Ethernet and could do native
> MacTCP/OpenTransport...

As far as I can tell, https://github.com/jasonking3/macipgw
should work fine as a replacement for ipddp.

     Arnd
