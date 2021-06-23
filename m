Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62583C4743C
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 05:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 336C56128C
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 05:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFWF2w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 01:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhFWF2v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Jun 2021 01:28:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53462C061756
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 22:26:34 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so3162103pjb.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=cn5envrgx5GAtu7W+COJVqITqJD+Wu8CREApOZRkqO8=;
        b=F04KpScvxEheYc8J+kj6npBZrB1QkG3uPUJUEAd9HSr+Fr/FOVvBk+txbsFbiCy0Dl
         1rXk5hFjSNLWjBumIazVLVTJqxFdQg/Rh0vPJxAQnDgB1TGnfVZ9WHCdaD/QrBoR4otC
         Mk65Lz7xwkKYaBJVQ7c9lOaD+sp/MW0rmUsV6cYp/VCjUxBHv9dAiXbMFHnsz64pkdJE
         jQTKq2GiiLcDZ3fxss/KUXQW1G2jmA5JodTwGY5rGuTDfMI2TcOchMGpAJpeXf9uIW8v
         Yx78DKad7rEWxzb8DJeOag8tt+C9WrJNjigo5zxsu0PCnFiGtLJeLYErU9YRfInKkpYO
         RVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=cn5envrgx5GAtu7W+COJVqITqJD+Wu8CREApOZRkqO8=;
        b=KVQv4vWZ6M/aUg87Xe9oDyXdWj1CbWwWzHhXCkzcVRC1z9FpUHBFSwpxSZFJMy9nK4
         y4xon9f/5//zT8fMItz8pXSKFT2MsftkH9VFI3sSCGf2BKlyNrw4xURAdsQ2uilMHWu6
         H/La6WK79iRsg2w0KhDs/dqeZnu0rQPmA59b0JzuwqnoLBU3npgHfTYXZYkCODXZDTes
         LYlrx0/+d369eqpU/AWXe0ppk8rvZjwHy2h+Pz/Ew63G2WXNfLsigmBPwGV/Kpl8vGyK
         r6BCPR1DsqGm0JPqZMGo/W62RxhaCpl2h2F4ex7CMYIezRPG03jINiCLE5N94GS1q+bC
         h48Q==
X-Gm-Message-State: AOAM533UY+/r+8P3PMeAVt6eR6nwtMgwtKaOw3eKpjSwD5sO6nvHN771
        Rgtg9SHhC4W9KqH/j4/sZoQ=
X-Google-Smtp-Source: ABdhPJwtTPgr9/TC5SCNAt/BhMKJv8yHF4vp9bxraRVqz1W/jpRTDwopkssngp94CqTqDkWNRFJKMw==
X-Received: by 2002:a17:902:da84:b029:126:2a2:cb89 with SMTP id j4-20020a170902da84b029012602a2cb89mr8971220plx.6.1624425993509;
        Tue, 22 Jun 2021 22:26:33 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id o1sm994113pfk.152.2021.06.22.22.26.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 22:26:32 -0700 (PDT)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
 <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
 <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
 <87h7hpbojt.fsf@disp2133> <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <55bdad37-187b-e1f5-a359-c5206b20ff4d@gmail.com>
Date:   Wed, 23 Jun 2021 17:26:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eric,

Am 23.06.2021 um 09:48 schrieb Michael Schmitz:
>>
>> The challenging ones are /proc/pid/syscall and seccomp which want to see
>> all of the system call arguments.  I think every architecture always
>> saves the system call arguments unconditionally, so those cases are
>> probably not as interesting.  But they certain look like they could be
>> trouble.
>
> Seccomp hasn't yet been implemented on m68k, though I'm working on that
> with Adrian. The sole secure_computing() call will happen in
> syscall_trace_enter(), so all system call arguments have been saved on
> the stack.
>
> Haven't looked at /proc/pid/syscall yet ...

Not supported at present (no HAVE_ARCH_TRACEHOOK for m68k). And the 
syscall_get_arguments I wrote for seccomp support only copies the first 
five data registers, which are always saved.

Cheers,

	Michael
