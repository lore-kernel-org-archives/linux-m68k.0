Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDA5C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Oct 2021 22:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82D2160FED
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Oct 2021 22:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhJRWc3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Oct 2021 18:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJRWc3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 18 Oct 2021 18:32:29 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1D9C06161C
        for <linux-m68k@vger.kernel.org>; Mon, 18 Oct 2021 15:30:17 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id k3so6125269ilo.7
        for <linux-m68k@vger.kernel.org>; Mon, 18 Oct 2021 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qb2YtI7uJqY2Ro6Vf7FFi9SKRjNHAkyupA1sfNi1uJs=;
        b=sJKvspDwJeLm1hxx45LBJiwvpza52nLgqYu4jYMKCZzgo9n2Hp6hj1kB0mBRpMJnGm
         71c/xLPlvljp5XhNCZ5+FtG9wnhGMBac2fEckN/+7uqMn67/0fFs6JFdv41Cux9GkmWu
         EeHi4S6dRuqS79YtNO3IM9vPOJmuoPxaomwWUrABfcRwk/iyOjKIQ4scvKWUhD7uMQOb
         UWo/St6xy2uesTf4XZ4tYs91vVWuohBAIXKIj7PAtSYcvTahy2dmkD0Lm9ukl6hwbFrq
         CqAyuXYTEjqqTNM1Vzo+NzS4jlQYtNRyY+A0yAk0n1/A8fVGx6xVDCrUzorhkJY+4mKO
         DiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qb2YtI7uJqY2Ro6Vf7FFi9SKRjNHAkyupA1sfNi1uJs=;
        b=7Q4u8Cuycco0S3JsFWXjTaKeM8sSBQ9ul/+8D9i6ko7nv7sR5T6RhD1F4wUn19WK2k
         KHIQOlEo5nIfVqukV7iUpuowdoxeqA+vtjZ1QNDh7lH6dKYVvijhbYK4J9lBqQdNu4qp
         E+tVrl02MvsK6MujMNpgQ3kudeq4DL+9IN9VIKvNIHWZSBDmZITix9rOZa00e7OOM8Pn
         vlgZIgmX897+YJusl7P8oluxEMFyc3BJ1iM21qVg3U69vfEb6ziX2vI/mVJYDzP5W4O5
         jdM3v/DVxgeZNyVk3J5kxMDzIlloo9sTQ2gYH1t5ohnJz8yzSlVUTcbkGaQ02wuSVzB8
         am5w==
X-Gm-Message-State: AOAM533MdKlFgQ59glvkZQ6g6BqAW/T3KQidnwui+YNIIJtX6IYMmAlU
        +cXxVO8IchkoEijUYSzu0A/4aw==
X-Google-Smtp-Source: ABdhPJzv72OiO1AUpG90oiTz3kxs6/4SYOcmdo7TyM3u85jVuC73UGG0u8JvFHtE5i/GxRZR6nLFtQ==
X-Received: by 2002:a05:6e02:20eb:: with SMTP id q11mr5810189ilv.70.1634596215416;
        Mon, 18 Oct 2021 15:30:15 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id q205sm7558033ioq.41.2021.10.18.15.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 15:30:15 -0700 (PDT)
Subject: Re: [PATCH RFC] block - ataflop.c: fix breakage introduced at blk-mq
 refactoring
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
Cc:     linux-block@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
References: <20211018222157.12238-1-schmitzmic@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8d60483d-3cd6-5df7-8db6-7a8b9ce462e3@kernel.dk>
Date:   Mon, 18 Oct 2021 16:30:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211018222157.12238-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/18/21 4:21 PM, Michael Schmitz wrote:
> Refactoring of the Atari floppy driver when converting to blk-mq
> has broken the state machine in not-so-subtle ways:
> 
> finish_fdc() must be called when operations on the floppy device
> have completed. This is crucial in order to relase the ST-DMA
> lock, which protects against concurrent access to the ST-DMA
> controller by other drivers (some DMA related, most just related
> to device register access - broken beyond compare, I know).
> 
> When rewriting the drivers' old do_request() function, the fact
> that finish_fdc() was called only when all queued requests had
> completed appears to have been overlooked. Instead, the new
> request function calls finish_fdc() immediately after the last
> request has been queued. finish_fdc() executes a dummy seek after
> most requests, and this overwrites the state machine's interrupt
> hander that was set up to wait for completion of the read/write
> request just prior. To make matters worse, finish_fdc() is called
> before device interrupts are re-enabled, making certain that the
> read/write interupt is missed.
> 
> Shifting the finish_fdc() call into the read/write request completion
> handler ensures the driver waits for the request to actually complete.

Was going to ask if this driver was used by anyone, since it's taken 3
years for the breakage to be spotted... In all fairness, it was pretty
horribly broken before the change too (like waiting in request_fn, under
a lock).

So I'm curious, are you actively using it, or was it just an exercise in
curiosity?

> Testing this change, I've only ever seen single sector requests with the
> 'last' flag set. If there is a way to send requests to the driver
> without that flag set, I'd appreciate a hint. As it now stands,
> the driver won't release the ST-DMA lock on requests that don't have
> this flag set, but won't accept further requests because the attempt
> to acquire the already-held lock once more will fail.

'last' is set if it's the last of a sequence of ->queue_rq() calls. If
you just do sync IO, then last is always set, as there is no sequence.
It's not hard to generate sequences, but on a floppy with basically no
queue depth the most you'd ever get is 2. You could try and set:

/sys/block/<dev>/queue/max_sectors_kb

to 4 for example, and then do something that generates a larger than 4k
write or read. Ideally that should give you more than 1.

-- 
Jens Axboe

