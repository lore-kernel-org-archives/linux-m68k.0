Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A12C05027
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 14:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjBFOBU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjBFOA5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 09:00:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5BE274AD
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 06:00:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 81FC4B8117D;
        Mon,  6 Feb 2023 14:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B2CC4339B;
        Mon,  6 Feb 2023 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675692032;
        bh=kpdjXR0cXnUQ2JIAfO7Y0MqFZo92hwKsA3yjij+pK3g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=rpxFgZc8kEVuP1fw2Ay+inbHGGPQG0Lo7ITvJ/MdHB/yL7kDHKAPEhDjeK22o4wrR
         B2KT58/kMfokRpG6kJFGZSBusOM3YWZF5U0VDXPaHmT+BZX6mNi/VWnd6ByulbxqBh
         beO/nPL5SQBVdcPrQuHRLT9ap6vkzObh0nA/3W2ypPCg26kWvNTJlt2tIU83Gn7T6Q
         NZo4xvhAkL47oMXc8IHAqpmTr56wpQdlm3A08tH1OUyqiQuFztRPCN7M1xdXc07jHE
         k8jxhxiX/771nVOFMkUBUepWRLaj1fYHmwnKc6h66AYD0eXBFUKm51QWW1S2IzRnY/
         0KkLKMygxjKRA==
Message-ID: <d9f468b5-a0b8-697a-05ce-8ab6a8151b68@kernel.org>
Date:   Tue, 7 Feb 2023 00:00:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: U-Boot support for M68K removal
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
 <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
 <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
 <40a0fdd71a65307e33dc3b5d8fd15d655fcb0607.camel@physik.fu-berlin.de>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <40a0fdd71a65307e33dc3b5d8fd15d655fcb0607.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 6/2/23 22:25, John Paul Adrian Glaubitz wrote:
> Hi Greg!
> 
> On Mon, 2023-02-06 at 22:02 +1000, Greg Ungerer wrote:
>> I wish I had a 54415 based board in my collection. Would make it so
>> much easier to keep the kernel working on it :-(
> 
> Maybe we can find one to buy for you. I would be happy to donate for it.

I'll gladly accept any surplus boards anyone has.
I have quite a few of the older ColdFire evaluation boards, but not all.
I only have a single M5475EVB for MMU testing currently though.

Regards
Greg



