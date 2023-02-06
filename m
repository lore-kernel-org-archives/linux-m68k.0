Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FAFC636D6
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 13:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjBFNui (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 08:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjBFNuV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 08:50:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017D81E291
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 05:50:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0DD260C8F;
        Mon,  6 Feb 2023 13:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45750C433EF;
        Mon,  6 Feb 2023 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675691394;
        bh=TlKA5kH7dPey2U9sWopmX3TaV0vO/MFo2c3vOdbddQQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tBcxuHbg4SbtbBskATqLhLWA6mAOLWW8KcfFQNZ4tpI57xom01jocPOGoSz9a1Xk5
         1xbPSldtiYOw+5+ldOfWwyu68HkNA/TkavDwdR8haEuA8xh6I3zMF7gbuW34owNHvJ
         xrTH0YG/dwuTWU/DHrmP8wX94l/mvCXalXm2qDTXxSHjRfSfENBZvc8gLeC4bUS/+N
         6ioanzC2llRUAK/0P2Zm5wBV/Ga8/U9Kabs0smU22b+iJzfMcLObRKvqJG/DsfKAe/
         0oMnYdL536o8ensXvdlRfV5Eu+Yexz4ohGGRMM/VGbLpOguM+J3uaokQpLCBY+g58K
         aON6xiyPv7rjw==
Message-ID: <3a469173-19dd-5e69-b50c-dd98e404aabe@kernel.org>
Date:   Mon, 6 Feb 2023 23:49:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: U-Boot support for M68K removal
Content-Language: en-US
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tom Rini <trini@konsulko.com>,
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
 <CALJHbkBMNd-3sqCaAFMxc__7NBYRB7-D9SmH4VqRTM=cTpUxaw@mail.gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CALJHbkBMNd-3sqCaAFMxc__7NBYRB7-D9SmH4VqRTM=cTpUxaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 6/2/23 22:59, Angelo Dureghello wrote:
> Hi Greg,
> 
> On Mon, Feb 6, 2023 at 1:02 PM Greg Ungerer <gerg@kernel.org> wrote:
>>
>>
> 
>> I wish I had a 54415 based board in my collection. Would make it so
>> much easier to keep the kernel working on it :-(
>>
>> Regards
>> Greg
>>
> 
> I can solder here one additional stmark2 for you when i find the time.
> 
> You can send me your data at
> angelo AT kernel-space.org

That would be fantastic, thanks!

Regards
Greg

