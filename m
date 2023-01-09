Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE436C5479D
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Jan 2023 23:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234963AbjAIXvo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjAIXvn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Jan 2023 18:51:43 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62409EAA
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Jan 2023 15:51:42 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id h7so3257661pfq.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Jan 2023 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB+iffEKVzv5eunS5GJ5f80eky1MKpPN3FfJFW+H+zg=;
        b=HpvaW6w0qNfxzdHC/6GcVDFnfj1hqmXH8hweGraFgL5ukRcwPd/DQhd0E5cg2i0mFD
         +JKX9n5zhiKfyRZhYJjCNjtW0d1Jnoad/JyDS3+8i/M48UV5HUz3WANCI3O93MjXQ/Jh
         zzwsdd/1DUbIz8r5eaRzrQovFw9jA2Sg8YxhleFb58eRUwdFfK0zbovccJ4TcYeH3MFj
         5/e0FANGymNtpb8Z14wV7vdRrvzH8nUSANHfjeBi0zhuCxTcbDUicTBoGx5uVvoY6xBx
         ua33Ll82/4qoDJJR2ncbBkghs2on6ANllLGDINNDbZuYq39kV4fwhQA6D/DN+KrZcuZn
         NfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB+iffEKVzv5eunS5GJ5f80eky1MKpPN3FfJFW+H+zg=;
        b=zluTadfAXhC33tLisooSl8NeXXKv97+GH74NIoJ6WfoXr5vJ7OQ+JdypnlSFpuA5q8
         5tMkGYoVwQ+3iGpKmpdBCoHlK9gRSNWOh0FAsqTV2en0b/Ke01Ui0blzDqaDP5OqFvMz
         rwGMFxJ2J6vKOo3KYicN/rr3P2WtXwz6eQTIP7Zo1/GPPOKA5VvtJhMZyu/Pm/M+adrK
         WIGCppGw/eoy0MpLGVg1whL40B/o9ey0jTwkZspsKd6s/b1nvpiA+mZ8uvidA6tnGqom
         vhXv9Przyn6mi2fdqLej4yfLZpfQtErqKYhEYq03rSnJCZ2VDgqmrfhjdiItT09E4TU4
         EFTw==
X-Gm-Message-State: AFqh2kqoJd1cJVFaFhpDjl9bnZhOGE/0NnuNLwOZXQYQJh04oM0HDvnC
        +J863hEX4q8oNwk0z39nvNNu9pGYlyU=
X-Google-Smtp-Source: AMrXdXs4gUNu5+DhpVUxVkeBFnPBCXT+yL6d0k2+Ee97zS7t8dMT/PFtOR56GqSmXFF1BR7lUOoZtQ==
X-Received: by 2002:a05:6a00:4c0a:b0:589:85ed:4119 with SMTP id ea10-20020a056a004c0a00b0058985ed4119mr3324361pfb.32.1673308301345;
        Mon, 09 Jan 2023 15:51:41 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id r4-20020aa79624000000b0056bd1bf4243sm6656573pfg.53.2023.01.09.15.51.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Jan 2023 15:51:40 -0800 (PST)
Subject: Re: Current status of seccomp support in the m68k kernel?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <0fbcfa49-c77f-f67d-44ad-f8430274ca9d@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <965fc3be-8025-2af7-4e84-51d5beae6ec7@gmail.com>
Date:   Tue, 10 Jan 2023 12:51:35 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <0fbcfa49-c77f-f67d-44ad-f8430274ca9d@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

see:

https://lore.kernel.org/r/20220127074158.25888-1-schmitzmic@gmail.com

for the last version of this patch series.

According to 
https://lore.kernel.org/r/CAMuHMdVUFt2BX7m4BAMP8aJ9Si=sj8eupPf_oQ4_THPH5+b6HQ@mail.gmail.com, 
Geert had taken the first patch for v5.19, and it's showing up as commit 
ee9a94d93adcc147052da15816580b007d3b0a5b.

Hmmm... patch #3 does no longer cleanly apply since 
tracehook_report_syscall_entry() was replaced by 
ptrace_report_syscall_entry(). I'd better sent an updated version.

I have a further patch that adds m68k support to the kernel seccomp 
self-test code that may need updating to current mainline, will add that 
to the series.

Cheers,

	Michael

Am 10.01.2023 um 01:37 schrieb John Paul Adrian Glaubitz:
> Hi!
>
> I have finally found some time again to work on the userland m68k
> support for
> seccomp and I was wondering what the current state of the kernel support
> is?
>
> If I remember correctly there were some patches posted that needed testing?
>
> Adrian
>
