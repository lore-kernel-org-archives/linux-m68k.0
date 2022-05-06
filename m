Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3D6C433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  6 May 2022 08:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390180AbiEFIky (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 May 2022 04:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238317AbiEFIkv (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 6 May 2022 04:40:51 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74651FA4A
        for <linux-m68k@vger.kernel.org>; Fri,  6 May 2022 01:37:09 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id x18so6766837plg.6
        for <linux-m68k@vger.kernel.org>; Fri, 06 May 2022 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2OvWfU1yoJydoeFxwFqx41FSLqWpA99A6Qzffh14UxE=;
        b=lOQUNMl5f9HeF9vN69CrFmZURcHvFiCbzYVC7UCCODl0WzqxAiOiKrAoG1G9sdU5Om
         q9V4OoUeB5eRt51AqSh4WfKSB5KY/oV600i+irZAZl+kxAXm/qs8LqKvZu4M0GPjFGY3
         HbKJapWaOrcHLz3FMNjvhh9Fol0FYRowulqIITIdTDIksRsk/t97xxyB+OiSValBQU2U
         LmpXOjxJaXnbiX7FxtB3/3Pb8BqQyTAi3akgvvo3G/+iNrPrFW/MjuDdjwVGmFs79H21
         hY68pCiAsQ2WkjfTSIL9rD/+HT5Osw17IdrecOuI4X3VJ0NulPINEcPaZXvH2wjhJM13
         RgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=2OvWfU1yoJydoeFxwFqx41FSLqWpA99A6Qzffh14UxE=;
        b=QVIJY3wkGDBa0q/gWG6faz9WoPgYT8R3lz8YTZfa1rUqb5yr7e8mseF3wzbZ/Ltekv
         mDx0/dzUDF4AJtoge0fTvYyqL/pRp8ECL4aqPJI68rgmtAgu6imBO5qSR0JdejdL4mG2
         fduvZWgboZDUNAQpfKtMrZphETJBwodv2WZLBADqXtaKtY7BPQO8sEL3fX4q76oN/GsO
         n+PqxHOIiflfg3vaj1voOFiTMVBqPrzeEVzFu8Trg4WwBb0Q5gI4Fj7wNf/a0ElL6z19
         x9WAf3cK/631XMPN6QnzhPHQbH7bhjgjUozDIxhwk5TEW3IttV3+kd/J0M89RhGJuU8e
         fLkA==
X-Gm-Message-State: AOAM531vYMu+10I9ozMqepOOeEcsdQiruh5uFqzCYPqZGqt/J/HnuIga
        3LMjo6LPnWt9b0bQQAROoorlOkCESfc=
X-Google-Smtp-Source: ABdhPJzFwlWly43okTlOidMdDbxri7X/q3wzKXN5ejQPDKns5MMm9akt8W0sD1gt3/fjJM9Cq26+rA==
X-Received: by 2002:a17:902:710c:b0:15e:e759:c907 with SMTP id a12-20020a170902710c00b0015ee759c907mr2435279pll.140.1651826229428;
        Fri, 06 May 2022 01:37:09 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-142-fibre.sparkbb.co.nz. [222.152.175.142])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090322c200b0015e8d4eb1f6sm1124454plg.64.2022.05.06.01.37.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 May 2022 01:37:08 -0700 (PDT)
Subject: Re: [PATCH v10 0/3] Add kernel seccomp support for m68k
To:     "Eric W. Biederman" <ebiederm@xmission.com>
References: <20220127074158.25888-1-schmitzmic@gmail.com>
 <87r15ajnam.fsf@email.froward.int.ebiederm.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        viro@zeniv.linux.org.uk, glaubitz@physik.fu-berlin.de
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0955ca4b-bbe8-7978-4ac3-c6accac9d203@gmail.com>
Date:   Fri, 6 May 2022 20:37:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87r15ajnam.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eric,

Am 04.05.2022 um 09:53 schrieb Eric W. Biederman:
> Michael Schmitz <schmitzmic@gmail.com> writes:
>
>> Patch 3 adds the test for TIF_SECCOMP thread info flag to call
>> into syscall_trace_enter() when seccomp syscall filtering
>> is active, which was missing from earlier versions (classic
>> MMU m68k only - need some help with the test for 68000 and
>> coldfire).
>>
>> The previous version required the TIF_SYSCALL_TRACE
>> flag to be set for syscall filtering to work
>>
>> The rest of the series remains unchanged from v9.
>>
>> Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
>> (33 with the old version).
>>
>> I hope you didn't waste too much effort on testing v8/v9, Adrian.
>> Should have a suitably large brown paper bag somewhere yet :-(
>
> Has any progress been made on testing or merging this patch series?

This series totally dropped off my radar, sorry. I had run out of 
options to test, and have been too busy to do much about that.

> I was just thinking it might be nice if the only callers of
> ptrace_report_syscall were ptrace_report_syscall_entry and
> ptrace_report_syscall_exit.

Just merging patch 1 would be enough there AFAICS. Any reason not to do 
that, Geert?

Cheers,

	Michael


>
>
> Eric
>
