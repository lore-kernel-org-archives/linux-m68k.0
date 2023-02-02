Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E21C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Feb 2023 19:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbjBBTEF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Feb 2023 14:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjBBTEE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Feb 2023 14:04:04 -0500
X-Greylist: delayed 593 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Feb 2023 11:03:59 PST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7864562241
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Feb 2023 11:03:59 -0800 (PST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4P77HJ29rlz1r1NF;
        Thu,  2 Feb 2023 19:54:04 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
        by mail.m-online.net (Postfix) with ESMTP id 4P77HJ0qJHz1qqlR;
        Thu,  2 Feb 2023 19:54:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
        with ESMTP id fl5Ca2LeXJDF; Thu,  2 Feb 2023 19:54:03 +0100 (CET)
X-Auth-Info: D8OAGyHEOu8itnBiwSIIslWO0jTcxnakxKI9fSSax69VtKbbLyQhH0mpSKQuIunr
Received: from igel.home (aftr-82-135-86-118.dynamic.mnet-online.de [82.135.86.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  2 Feb 2023 19:54:03 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id BB6C72C12F3; Thu,  2 Feb 2023 19:54:02 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: m68k assembly question: jsr vs. bsr
References: <45aa9faee34d73515abcc073812ae1d32f821e3d.camel@physik.fu-berlin.de>
        <CAMuHMdXE6iPqW=weJyS-AGYMgbaLwA-JjYGhDJj06hw2qK8oHQ@mail.gmail.com>
X-Yow:  My uncle Murray conquered Egypt in 53 B.C.  And I can prove it too!!
Date:   Thu, 02 Feb 2023 19:54:02 +0100
In-Reply-To: <CAMuHMdXE6iPqW=weJyS-AGYMgbaLwA-JjYGhDJj06hw2qK8oHQ@mail.gmail.com>
        (Geert Uytterhoeven's message of "Thu, 2 Feb 2023 08:44:30 +0100")
Message-ID: <87fsbnj3ud.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Feb 02 2023, Geert Uytterhoeven wrote:

> Hi Adrian,
>
> On Wed, Feb 1, 2023 at 11:17 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> Can anyone answer this question regarding the difference between "bsr" and "jsr":
>>
>> > https://github.com/llvm/llvm-project/issues/60354#issuecomment-1412018845
>
> "jsr" is an absolute jump to a subroutine.
> "bsr" is a relative jump (8-bit, 16-bit, or 32-bit signed offset) to a
> subroutine,
> i.e. typically for calling a nearby function.

jsr/jmp also take pcrel, but bsr/bra with 8-bit disp is shorter.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
