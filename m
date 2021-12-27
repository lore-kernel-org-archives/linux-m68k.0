Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7DC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Dec 2021 11:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhL0L4t (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Dec 2021 06:56:49 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:45666 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236551AbhL0L4t (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Dec 2021 06:56:49 -0500
X-Greylist: delayed 9434 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Dec 2021 06:56:48 EST
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4JMx3L5WrDz1qwGy;
        Mon, 27 Dec 2021 12:56:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4JMx3L546Hz1qqkC;
        Mon, 27 Dec 2021 12:56:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id o33Iijis0uSM; Mon, 27 Dec 2021 12:56:46 +0100 (CET)
X-Auth-Info: uToUgyJz9p2d6vR+4o64kflQcZh+sB8BeRNX0axz9GI+YTe48LuV7d4dns2AwZhX
Received: from igel.home (ppp-46-244-168-165.dynamic.mnet-online.de [46.244.168.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 27 Dec 2021 12:56:45 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 6A9652C38D8; Mon, 27 Dec 2021 12:56:45 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k/kernel: array out of bound access in
 process_uboot_commandline
References: <20211227090917.35838-1-hbh25y@gmail.com>
        <87h7aus8v0.fsf@igel.home>
        <CAOo-nLJG71QqqD0-cJDyH0rY2VTx1eO9nHVQ5MCe8J0iiME_vw@mail.gmail.com>
X-Yow:  Yow!  Are we wet yet?
Date:   Mon, 27 Dec 2021 12:56:45 +0100
In-Reply-To: <CAOo-nLJG71QqqD0-cJDyH0rY2VTx1eO9nHVQ5MCe8J0iiME_vw@mail.gmail.com>
        (Hangyu Hua's message of "Mon, 27 Dec 2021 19:52:58 +0800")
Message-ID: <87bl12s1ky.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Dez 27 2021, Hangyu Hua wrote:

> If we don't use
> commandp[0]=0 in len == 0,
> than commandp will not have a zero-terminated.

That doesn't make sense.  There is no room for the zero.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
