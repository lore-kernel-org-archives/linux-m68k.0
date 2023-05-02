Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3CEC77B7E
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 16:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjEBQv5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 12:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjEBQv4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 12:51:56 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900981BC7
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 09:51:52 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q9mMB4Kkrz1sBpn;
        Tue,  2 May 2023 18:51:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q9mMB3tC0z1qqlS;
        Tue,  2 May 2023 18:51:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id pdxAwupyhvZz; Tue,  2 May 2023 18:51:49 +0200 (CEST)
X-Auth-Info: XKAmGoEi4fJZmy+SJT5WOI16DsupDFUp7lFktDgoeiymsAeNDc9bsFjn5Gc1shk3
Received: from igel.home (aftr-82-135-86-105.dynamic.mnet-online.de [82.135.86.105])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  2 May 2023 18:51:49 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 6C0112C12FA; Tue,  2 May 2023 18:51:49 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        "Michael Schmitz" <schmitzmic@gmail.com>
Subject: Re: [PATCH RFC 1/2] m68k: Don't deliver signals except at
 instruction boundary
In-Reply-To: <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org>
        (Finn Thain's message of "Tue, 02 May 2023 16:50:27 +1000")
References: <cover.1683010227.git.fthain@linux-m68k.org>
        <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org>
X-Yow:  O.K.!  Speak with a PHILADELPHIA ACCENT!!  Send out for CHINESE FOOD!!
 Hop a JET!
Date:   Tue, 02 May 2023 18:51:49 +0200
Message-ID: <87v8havfq2.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mai 02 2023, Finn Thain wrote:

> From: Andreas Schwab <schwab@linux-m68k.org>
>
> Signal delivery should only happen at insn boundaries, but due to the
> way the 030 handles return from bus error exceptions (the insn is resumed,
> not restarted like on the 040/060) the kernel may do it in the middle of
> the faulting insn.

I don't think this will work properly when the address cannot be
resolved.  The bus error exception will just be raised again
immediately.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
