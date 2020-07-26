Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB2BC433E0
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:08:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8C9E206D8
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGZVI5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 17:08:57 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:53785 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgGZVI5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 17:08:57 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BFFsy2Cc8z1qrFs;
        Sun, 26 Jul 2020 23:08:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BFFsy1bJ3z1r57H;
        Sun, 26 Jul 2020 23:08:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id l1Bz6kSbjQeA; Sun, 26 Jul 2020 23:08:53 +0200 (CEST)
X-Auth-Info: gf6ZAcAs+VbZX6EyBcy/mzmwaIcyG7vwk+IfyI4Z+koCcwdJDAjZNmvDAqpKqj9X
Received: from igel.home (ppp-46-244-174-182.dynamic.mnet-online.de [46.244.174.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 26 Jul 2020 23:08:53 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id AAB6C2C1293; Sun, 26 Jul 2020 23:08:52 +0200 (CEST)
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
        <877durreph.fsf@igel.home>
        <80cef911-af86-c49f-5ac3-1cfe7037de80@gmail.com>
        <87wo2q5yhx.fsf@igel.home>
        <460261ab-8c10-d625-a4e4-a4e755413018@gmail.com>
X-Yow:  I fill MY industrial waste containers with old copies
 of the ``WATCHTOWER'' and then add HAWAIIAN PUNCH to
 the top..  They look NICE in the yard--
Date:   Sun, 26 Jul 2020 23:08:52 +0200
In-Reply-To: <460261ab-8c10-d625-a4e4-a4e755413018@gmail.com> (Michael
        Schmitz's message of "Mon, 27 Jul 2020 09:02:03 +1200")
Message-ID: <877duq56hn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 27 2020, Michael Schmitz wrote:

> Hi Andreas,
>
> On 26/07/20 11:03 PM, Andreas Schwab wrote:
>> On Jul 26 2020, Michael Schmitz wrote:
>>
>>> No particular reason - I had seen testb used in the syscall entry code and
>> Where?  That may be bugs.
>
> Here:
>
> ENTRY(ret_from_signal)
>         movel   %curptr@(TASK_STACK),%a1
>         tstb    %a1@(TINFO_FLAGS+2)
>         jge     1f
>         jbsr    syscall_trace_leave
> 1:      RESTORE_SWITCH_STACK
>         addql   #4,%sp
> ....
>
> and here:
>
> ENTRY(system_call)
>         SAVE_ALL_SYS
>
>         GET_CURRENT(%d1)
>         movel   %d1,%a1
>
>         | save top of frame
>         movel   %sp,%curptr@(TASK_THREAD+THREAD_ESP0)
>
>         | syscall trace?
>         tstb    %a1@(TINFO_FLAGS+2)
>         jmi     do_trace_entry
>         cmpl    #NR_syscalls,%d0
>         jcc     badsys
>

How is that relevant?  That is testing a single bit, of course.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
