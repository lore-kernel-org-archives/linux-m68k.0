Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8588EC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 18:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbiAQSHM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 13:07:12 -0500
Received: from out02.mta.xmission.com ([166.70.13.232]:42158 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiAQSHL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 13:07:11 -0500
Received: from in01.mta.xmission.com ([166.70.13.51]:40718)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1n9WPO-00H67Q-Ns; Mon, 17 Jan 2022 11:07:10 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:48064 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1n9WPN-003bnQ-L4; Mon, 17 Jan 2022 11:07:10 -0700
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        viro@zeniv.linux.org.uk
References: <20220113010903.720-1-schmitzmic@gmail.com>
Date:   Mon, 17 Jan 2022 12:06:11 -0600
In-Reply-To: <20220113010903.720-1-schmitzmic@gmail.com> (Michael Schmitz's
        message of "Thu, 13 Jan 2022 14:09:00 +1300")
Message-ID: <87r1969qzw.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1n9WPN-003bnQ-L4;;;mid=<87r1969qzw.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.110.24.146;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1/LB0JhkancGMX2MZoVPU/QzksZAQE87WA=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v8 0/3] Add kernel seccomp support for m68k
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic@gmail.com> writes:

> Respin of m68k kernel seccomp support, again. 
>
> I have split the (MMU) m68k switch to syscall_trace_enter()/
> syscall_trace_leave() patch from the patch adding return code
> checks for syscall_trace_enter() as suggested by Al Viro. 
>
> Patch 1 could now replace Eric's patch 'Stop open coding
> ptrace_report_syscall'.

That change has merged and should show up in v5.17-rc1, but that should
not matter in practice.  This series just deletes the function I
modified and replaces it with something that is equivalent for my
purposes.

> Rest of the series remains unchanged.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Eric
