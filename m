Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917EDC433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  3 May 2022 21:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243242AbiECV5W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 May 2022 17:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiECV5V (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 3 May 2022 17:57:21 -0400
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A423A731
        for <linux-m68k@vger.kernel.org>; Tue,  3 May 2022 14:53:48 -0700 (PDT)
Received: from in02.mta.xmission.com ([166.70.13.52]:55348)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nm0So-00As80-3f; Tue, 03 May 2022 15:53:46 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:36832 helo=email.froward.int.ebiederm.org.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nm0Sn-009WoI-06; Tue, 03 May 2022 15:53:45 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        viro@zeniv.linux.org.uk, glaubitz@physik.fu-berlin.de
References: <20220127074158.25888-1-schmitzmic@gmail.com>
Date:   Tue, 03 May 2022 16:53:21 -0500
In-Reply-To: <20220127074158.25888-1-schmitzmic@gmail.com> (Michael Schmitz's
        message of "Thu, 27 Jan 2022 20:41:55 +1300")
Message-ID: <87r15ajnam.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1nm0Sn-009WoI-06;;;mid=<87r15ajnam.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.174.4;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX19fZRfSSHkXkMFfCcC9FJog6dqCZkOqsBQ=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v10 0/3] Add kernel seccomp support for m68k
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic@gmail.com> writes:

> Patch 3 adds the test for TIF_SECCOMP thread info flag to call
> into syscall_trace_enter() when seccomp syscall filtering
> is active, which was missing from earlier versions (classic
> MMU m68k only - need some help with the test for 68000 and
> coldfire).
>
> The previous version required the TIF_SYSCALL_TRACE
> flag to be set for syscall filtering to work
>
> The rest of the series remains unchanged from v9. 
>
> Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
> (33 with the old version).
>
> I hope you didn't waste too much effort on testing v8/v9, Adrian.
> Should have a suitably large brown paper bag somewhere yet :-(

Has any progress been made on testing or merging this patch series?

I was just thinking it might be nice if the only callers of
ptrace_report_syscall were ptrace_report_syscall_entry and
ptrace_report_syscall_exit.


Eric
