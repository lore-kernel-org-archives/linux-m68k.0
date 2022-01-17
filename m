Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C52C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 20:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbiAQUrK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 15:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiAQUrK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 15:47:10 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19ADAC061574
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 12:47:10 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id g2so11894941pgo.9
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2xvaf42Wt/3l0tyCUDYBEHzKuRUaq9pJoLXebVf+iL4=;
        b=Y/x26LfcZ9AACAXjfTDNYorbQgBUpjW7l2Ax+E/85seWX3Aw5YEg7/yNxSv/CTW0hN
         aVX+UsqYpB+ZgqP2RUTeJLy0w0P9L7dG/IN0c27uWyFbaUnW3Q4BWWWDCzWPjw204zSh
         sgRL3fH9D2jv9Z+FPWolo6NHN5VyJ6pnfuxaDU7+m6qdCxLSkqGT7S8f8+AcxtEZdSHD
         H+LY3FaYsJGEu0ciT7AThwJIJkFtETD3c7KY+0O7RQX/knTPR6ucocQz0JuP/RJc/ujT
         yADsJ3IpA1TmSPbXfRgVajPlxqUC18p7mAjgOl85fTVDiLi1ApN9M3PmeBRLyWb7QS7F
         UNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=2xvaf42Wt/3l0tyCUDYBEHzKuRUaq9pJoLXebVf+iL4=;
        b=YUOxkgG5vtBdZ25nQApp8uOANC6Y5YK2wNe8yrYXMzTpBVz9Svg3Fxa4pVSMi5HGhn
         MNA8z7skhcUhUg/+gimwX1RnfUC8J4+41iXt4Gxu5djQY+SrQvmsnHPEZnmHIYvNg9CE
         RtN2nKVa1hSLb7qOk1BJM4L1kvCkG3imnoycOyWGP/rxhzTg6ORObdvKRgIWG11Al1E+
         ff0J4UwTpw1d/ioC0YIbR6Zm32v3bLmEygGJcGLg+oiv7c+Qlq9bCp+/UW6/arQFFkG3
         L+XpQsTVaYsm2Zqgbx4mRjtGYnmsfeR1xsjhQ6GtfOCVtnAnTMLIfAI+oYVkVCPTwVSB
         sAiQ==
X-Gm-Message-State: AOAM533neuAj6uenlXtaYMpe2JLZiwxMA6GkC90jWolN0ZMGewCCXWGE
        xNJbFyPryvAUVGCXGqqyBR8ZnRTOVxY=
X-Google-Smtp-Source: ABdhPJyn0qYm5tF1JtptDROr5JwyiPiyk+GBknoSqFCIud4Fw5PaS9UFMIx8gnhpIrixo03MmnSSFw==
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id q15-20020a056a00088f00b004bc3b4e255amr22676632pfj.79.1642452429449;
        Mon, 17 Jan 2022 12:47:09 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id p186sm14566111pfp.128.2022.01.17.12.47.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jan 2022 12:47:08 -0800 (PST)
Subject: Re: [PATCH v8 0/3] Add kernel seccomp support for m68k
To:     "Eric W. Biederman" <ebiederm@xmission.com>
References: <20220113010903.720-1-schmitzmic@gmail.com>
 <87r1969qzw.fsf@email.froward.int.ebiederm.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        viro@zeniv.linux.org.uk
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0b3c22c1-7d33-4268-6992-849e7c4360c0@gmail.com>
Date:   Tue, 18 Jan 2022 09:47:03 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87r1969qzw.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eric,

Am 18.01.2022 um 07:06 schrieb Eric W. Biederman:
> Michael Schmitz <schmitzmic@gmail.com> writes:
>
>> Respin of m68k kernel seccomp support, again.
>>
>> I have split the (MMU) m68k switch to syscall_trace_enter()/
>> syscall_trace_leave() patch from the patch adding return code
>> checks for syscall_trace_enter() as suggested by Al Viro.
>>
>> Patch 1 could now replace Eric's patch 'Stop open coding
>> ptrace_report_syscall'.
>
> That change has merged and should show up in v5.17-rc1, but that should
> not matter in practice.  This series just deletes the function I
> modified and replaces it with something that is equivalent for my
> purposes.

Thanks - I'll watch out for your patch to show up in 5.17-rc1 before 
respinning again.

>
>> Rest of the series remains unchanged.
>
> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Thanks,

	Michael

>
> Eric
>
