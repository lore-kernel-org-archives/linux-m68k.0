Return-Path: <SRS0=imOp=BE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2995C433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 11:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE378206EB
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 11:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGYLz6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jul 2020 07:55:58 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:50873 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgGYLz6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jul 2020 07:55:58 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BDPfM6cW0z1rtyS;
        Sat, 25 Jul 2020 13:55:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BDPfM61qrz1r57S;
        Sat, 25 Jul 2020 13:55:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id JfHwhNM5pce6; Sat, 25 Jul 2020 13:55:54 +0200 (CEST)
X-Auth-Info: 2JrEdCZY5rMic4jPFlunEO7JJNM/leUxrzALZYE+dnYDZTQ+AAkzr645mGTgSDsu
Received: from igel.home (ppp-46-244-184-156.dynamic.mnet-online.de [46.244.184.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 25 Jul 2020 13:55:54 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 5EB9D2C0B5C; Sat, 25 Jul 2020 13:55:54 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
Subject: Re: Seccomp support for linux-m68k
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
        <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
        <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
X-Yow:  Yow!  And then we could sit on the hoods of cars at stop lights!
Date:   Sat, 25 Jul 2020 13:55:54 +0200
In-Reply-To: <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com> (Michael
        Schmitz's message of "Sat, 25 Jul 2020 21:29:33 +1200")
Message-ID: <877durreph.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 25 2020, Michael Schmitz wrote:

> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -167,6 +167,8 @@ do_trace_entry:
>         jbsr    syscall_trace_enter
>         RESTORE_SWITCH_STACK
>         addql   #4,%sp
> +       tstb    %d0
> +       jne     ret_from_syscall

Why tstb and not tstl?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
