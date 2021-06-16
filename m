Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8D8C48BE6
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 07:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BC116044F
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 07:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhFPHaT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Jun 2021 03:30:19 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:60168 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhFPHaE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Jun 2021 03:30:04 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4G4cGh43Cwz1qtdr;
        Wed, 16 Jun 2021 09:27:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4G4cGh3Wvsz1qrkN;
        Wed, 16 Jun 2021 09:27:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id aueOI--L6Cye; Wed, 16 Jun 2021 09:27:55 +0200 (CEST)
X-Auth-Info: FQo7Zrc3zgu6PXY+W38A3CiE2nsXoc0RzAhe9LEez6L7fyiiMHzzLJr7DK9Uc/pZ
Received: from igel.home (ppp-46-244-160-108.dynamic.mnet-online.de [46.244.160.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 16 Jun 2021 09:27:55 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 1F5862C0314; Wed, 16 Jun 2021 09:27:55 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v4] m68k/kernel - wire up syscall_trace_enter/leave for
 m68k
References: <1623804565-25473-1-git-send-email-schmitzmic@gmail.com>
X-Yow:  I appoint you ambassador to Fantasy Island!!!
Date:   Wed, 16 Jun 2021 09:27:55 +0200
In-Reply-To: <1623804565-25473-1-git-send-email-schmitzmic@gmail.com> (Michael
        Schmitz's message of "Wed, 16 Jun 2021 12:49:25 +1200")
Message-ID: <87v96es1z8.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jun 16 2021, Michael Schmitz wrote:

> m68k (other than Coldfire) uses syscall_trace for both trace entry
> and trace exit. Seccomp support requires separate entry points for
> trace entry and exit which are already provided for Coldfire.
>
> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
> in preparation for seccomp support. Check return code of
> syscall_trace_enter(), and skip syscall if -1. Return code will be
> left at what had been set by by ptrace or seccomp (in regs->d0).

s/by by/by/

> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 9dd76fb..e949b66 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -164,9 +164,11 @@ do_trace_entry:
>  	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
>  	subql	#4,%sp
>  	SAVE_SWITCH_STACK
> -	jbsr	syscall_trace
> +	jbsr	syscall_trace_enter
>  	RESTORE_SWITCH_STACK
>  	addql	#4,%sp
> +	cmpil	#-1,%d0

That can be optimized as addql #1,%d0.

> +	jeq	ret_from_syscall

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
