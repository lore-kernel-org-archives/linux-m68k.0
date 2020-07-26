Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DCDC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FB1D206D8
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePcp0PV4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGZBek (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jul 2020 21:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGZBek (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jul 2020 21:34:40 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA72C0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 18:34:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so393705pje.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=mLMof1kuUbsc+nExhss4luZ/lbxEMXAsHmrr2sk0WsM=;
        b=ePcp0PV4TKD3nlz2kYW45oWHji4DIQugDaKy2EJOde+1UgbZj0NSa/2uAnZl/jOxEp
         h3Z50Y76XHuapkYqmVOhAqoB7ZA6ehR2qgCQrBtgYon3dvAPv6P/Ie/v88S+c7DITHpP
         m+nrCtgqNJu6f5okGGmGlFpTpSyS9XY07P4d1/m4bDkylzsNSuPKG5be33qFbdsCzFXY
         wArIolUYiBl/4ALPKaB4E7Kvqhqfhg/onBHwDkPoBmt0Bf9GjuYC+5pYizANTxCyR78y
         k+wcIIklYDuP6Yct7s/X/Sl5Yv5BsaDI2U025nbXAzaoKkPj0S6qoxLLBgQrx72M+86e
         go1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=mLMof1kuUbsc+nExhss4luZ/lbxEMXAsHmrr2sk0WsM=;
        b=ZF9hagDxYhUveZYZTYyd532lUVDYACQ1+HrlIa9ZLVN9GDrTON7pA79qYYglBxkC41
         isZDfI42zD5QknQa69cNEnm2yXP8XlFdubjDRHYFH47qycCHKly+3joEs64OK3JpYT0i
         dHhSjbALEGEpI0ZeUVnAEHDUzvnBbHR6Qf+RyfhuESSadJIU0FnPvMSHsY1CGM+4FU21
         f1XDksA23HGW6FuO7WsSlwLjENIsLq6/wZZTW8kDs/yeqFI7H870Do8KVRJjWDNMaaKY
         MgStDjgoNGsu5h1fYEmBKc2ktRsW586NIAKGNj478UflaaHvGMcSE8blJMlJEoZodWca
         yU6A==
X-Gm-Message-State: AOAM532a/DlOqDOdVFmKlDD1ZtyAlu4Jd2kCm4PiGCTN4UKLbV46XnuK
        uOiVvJKJM58qqDmVRX/9Yww=
X-Google-Smtp-Source: ABdhPJyuAiB5tCWunuL7jQslrSVM5WzEb0QmHLQxmHi4JzanV3XJ6i8o3NUKDd2Nb5++KrKuMpkl6w==
X-Received: by 2002:a17:90a:1f81:: with SMTP id x1mr11114463pja.115.1595727279223;
        Sat, 25 Jul 2020 18:34:39 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id w17sm10033963pge.10.2020.07.25.18.34.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2020 18:34:38 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
 <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com>
Date:   Sun, 26 Jul 2020 13:34:34 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

Am 26.07.2020 um 06:54 schrieb John Paul Adrian Glaubitz:
>> What return code would we need to set on returning from an aborted syscall?
>> (Without setting a specific one, -ENOSYS will be used by default.)
>
> If we're talking about syscall_trace_enter(), it should be -1.

OK, that's -EPERM. Reading the comment in asm/errno.h, -ENOSYS is not a 
legitimate return code for syscalls to use. I'll change the trace entry 
check to set -EPERM instead.

Andreas: could we preset -EPERM as return code on entering 
do_trace_entry to save another jump, possibly even without setting 
-ENOSYS before attempting the syscall, or would that break the syscall ABI?

Cheers,

	Michael


>
> Adrian
>
