Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F6C2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 23:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D9E61246
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 23:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhFNXSK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Jun 2021 19:18:10 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:38596 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhFNXSJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 14 Jun 2021 19:18:09 -0400
Received: by mail-pf1-f170.google.com with SMTP id z26so11784786pfj.5
        for <linux-m68k@vger.kernel.org>; Mon, 14 Jun 2021 16:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fQ4+RmqFbthqFKl0okyK5P56e4RJ0Qk2T+muCKi7ia8=;
        b=iWuwjHGJdVpdycsP2g7VFzEIVvzDBMbee7RYN7/FpDyHNAwFtDUwgdfXqWgzr+BKqr
         YK8QRmJLTBEt4KNYlouxpkdRw/9jb4V3CvOUQ9hOFmexSNED0jbIuzjOa7IVRei69RNc
         7Fz3FE8deDYHVpGyxzC/81IyYXZrMhrfQwNo7BDdNhNW+NQ15QPRUOma68gIv31aKRTw
         JaB3ZToa9Pr4xaQTDTYNNu2BOUGq39at6zumNbWq3sj9tgQWGnLK6d5AItpBFBI+7l2V
         22eOy2T2szyoodFkofW8IHNajHo1kpOrccVZO4JqHcGwHddIxc9gwLjw66WLCqUS5Owy
         5IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fQ4+RmqFbthqFKl0okyK5P56e4RJ0Qk2T+muCKi7ia8=;
        b=lIaJZCWT81j/zkygt/lJ/79knLeY4qjF5xg9hbel+xSWgo2tJgKwPUn5RvzAeOqA8q
         pUUGmRegWSmO0iJDwHG8ML8z3yoHxhYt1VTOOlWe5mWrrV6vIvU7z9OL+zTpK9v5bbPb
         dzwKpXXDjHeDe1Zo+M0JaTeyhIxhcPWubkhqDQqKrrpP7ThE7glayf8H+cSdUuc1Ty0V
         Ie/9fQz+ERYgKb7Vb79gxQbTGr+3mfyBqAmbPDWTJDXDJ6kzjQDT7fCFmEo0Iw+YwdLw
         XZSsI5V4zzQylY2XFSR41grzjz6r2QQOqrkjF3O/P47yeDDg2Be7YYr2sQwRXt2sVzAy
         2Chw==
X-Gm-Message-State: AOAM532QnYty+Wqrp1H4UhYXXGYhIiDXDMYICuGmx5vD7M4b0O96rOhe
        b4rc1+n1xBZ0zM7lX7s/G7Xzx2ZH058gWw==
X-Google-Smtp-Source: ABdhPJzgA7tUdEu5sDgz/RR3IShpw9XGduMbu4JI/nl8pK8AgVAq7c0Rxgqz2Eo0EGJtlFbunkmMSQ==
X-Received: by 2002:a63:1f25:: with SMTP id f37mr2961378pgf.61.1623712496684;
        Mon, 14 Jun 2021 16:14:56 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:108d:81dd:b77d:48cd? ([2001:df0:0:200c:108d:81dd:b77d:48cd])
        by smtp.gmail.com with ESMTPSA id 60sm13270021pjz.42.2021.06.14.16.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 16:14:56 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
 <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
 <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
 <76e2f396-ec94-2615-4fea-0f33f6564f19@gmail.com>
 <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2dd5ced6-ed01-c029-be5c-4dbfee2d9d05@gmail.com>
Date:   Tue, 15 Jun 2021 11:14:51 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 15/06/21 11:04 am, John Paul Adrian Glaubitz wrote:
> On 6/15/21 12:11 AM, Michael Schmitz wrote:
>> working on entry.S recently, I was reminded of this one. It's never been applied, and I can't find a trace of it in my tree.
>>
>> Not sure how far Adrian got with seccomp support testing, so I'm uncertain this is still of interest ...
> I still have a fork of libseccomp with m68k support and my SH support patch
> was merged upstream.
>
> So, if you guys can get the kernel bits in place, I can take care of libseccomp.

Thanks - what (aside from my old patch) is still missing on the kernel 
side?

Cheers,

     Michael

>
> Adrian
>
