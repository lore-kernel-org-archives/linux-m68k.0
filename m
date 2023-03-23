Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB94C6FD1C
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Mar 2023 08:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjCWIsJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjCWIsI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Mar 2023 04:48:08 -0400
X-Greylist: delayed 512 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Mar 2023 01:48:07 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2C3FF25
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:48:06 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4PhzKc5pn4z1sB77;
        Thu, 23 Mar 2023 09:39:32 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4PhzKc4GBcz1qqlY;
        Thu, 23 Mar 2023 09:39:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id ClzVfOsz3AGx; Thu, 23 Mar 2023 09:39:31 +0100 (CET)
X-Auth-Info: Y+UMJ9JyeLs0U36Yyz5qoPqGiW5wfKK6b6F/ooNgPcoQtneAtR0Pa/OZWp7xmyaq
Received: from hawking (unknown [81.95.8.244])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 23 Mar 2023 09:39:31 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
X-Yow:  I am a jelly donut.  I am a jelly donut.
Date:   Thu, 23 Mar 2023 09:39:31 +0100
In-Reply-To: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
        (Finn Thain's message of "Thu, 23 Mar 2023 17:03:14 +1100")
Message-ID: <mvmttybx3ng.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mär 23 2023, Finn Thain wrote:

> Checkpatch says "externs should be avoided in .c files" and if this one
> appeared twice I would agree. But as it only appears once, I can't see
> any advantage to putting it in a new .h file instead of the .c file...

Anything wrong with declaring it in <linux/nubus.h>?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
