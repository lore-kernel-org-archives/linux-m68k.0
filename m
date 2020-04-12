Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15338C2BA2B
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 12:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2B5C206DA
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 12:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="D8T1EtRY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgDLM2p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 08:28:45 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35377 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgDLM2p (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 08:28:45 -0400
Received: by mail-oi1-f193.google.com with SMTP id b7so2799948oic.2
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ld84r2CrAhO74JRHVqC/3/y92W43GvYeCJ/YGfT+GYI=;
        b=D8T1EtRYyMgMF8Y2gwMgiXHbIIEYpl2KhXsy5EMhx/IAqnSk7Fd2Qtg2E+H7NbCsJT
         rb3W2L2TAQrmiBIQ1nXKxhbdMJBlCqZg6RMZkl+VzSFc40K+gBHkjWK/T330KQuNAmEv
         kLTKG1DqmZeJZKHJqGp+Of2kmWBwC3s4xxejX+pLJhOldu0OvNSFkz+o2tilEvY+NF8Q
         o6IzTWkTAeIvyOrIdFdSYyCgLabVAsE38k3I9Re2FsMvct9/dBLf02ff4lVTa7AwrOU2
         F7508FATgdJr8A4nSGFY6SsGFfHHiEQ32H2rGKdiyZPYe2CQ1DcPm5dMNuXnXgtqjeeP
         99BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ld84r2CrAhO74JRHVqC/3/y92W43GvYeCJ/YGfT+GYI=;
        b=gJ6yTZqgIJJk2TC1KOVN2zWNXVbHiaThn1cUiCDY27eAmNUFFHeVor74b2fkzXP0pg
         BqXlU0TKQedNxDWJoGc3cayuEqWaaq+UuQWSYQAedQtz1z5LqQHtF2NFUoLNBiNs6fKq
         F4Hbp/WG3ZP4j8k5dS68ApmjEhSrvNCXCkw3G4Wqn2vCZp5SzOBZ4LeKcs/jQBOvoLVv
         wkFIjzWMhzexTYJxS+AyiRgnSVD3VlocL/r1CH+ub1/ruScZPH4HabEDDKfboEL07exL
         WcrdHM3mZmKRJobglVYG/C9WhGU+cdO/L+AsWmHPgw0PufdfSFL9hUzldlWFuhP2HEwl
         d/vg==
X-Gm-Message-State: AGi0PuZca9B/16jRheqQ2yjuPXB84QH9R47QDf1ZA454vasmou4eXPfF
        45kYASOZaxGIzJRejUPwnrRphyzZj/I=
X-Google-Smtp-Source: APiQypJa6aY71YwRdgf5tPaerBs/ajXdboilgtekikvWN+deW5YtNLb0jcAhiBq0GpM7XrVYATTxeA==
X-Received: by 2002:a54:438c:: with SMTP id u12mr9245389oiv.47.1586694524976;
        Sun, 12 Apr 2020 05:28:44 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id 12sm3976290oii.54.2020.04.12.05.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 05:28:44 -0700 (PDT)
Subject: Re: Running m68k on qemu with external initramfs?
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <alpine.LNX.2.22.394.2004111608380.43@nippy.intranet>
 <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
 <alpine.LNX.2.22.394.2004121508200.50@nippy.intranet>
From:   Rob Landley <rob@landley.net>
Message-ID: <786d4659-0b05-4ce0-8eef-ed8d76e2ead7@landley.net>
Date:   Sun, 12 Apr 2020 07:34:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2004121508200.50@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/12/20 12:29 AM, Finn Thain wrote:
>>> It sounds more like a "modify kernel .config" problem. But it could be a 
>>> regression; what versions of qemu and kernel did you try?
>>
>> "Works for me", got it. I'll keep digging.
>>
> 
> If you want to try a kernel binary that works for me, so as to narrow down 
> the problem, you can get one from here:
> https://sourceforge.net/projects/linux-mac68k/files/

You have 4.1 and 4.14 kernels. The last one I had in my old build system (which
works but was uClibc based using gcc 4.2.1) was 4.3:
http://landley.net/aboriginal/downloads/binaries/system-image-m68k.tar.gz

But that was a static initramfs, not an external intitramfs.

>> QEMU is the one Laurent Vivier maintains that's been out of tree for 
>> something like 12 years now, the default branch claims to be "q800-dev" 
>> and the last commit was in december.
> 
> Should be fine. For the last few months I've used mainline QEMU instead.

Oh cool. (My last qemu build apparently just predated the merge, and hadn't had it.)

> That works for me, with a few tweaks:
>
> qemu-system-m68k -M q800 -serial none -serial mon:stdio -nographic 
> -no-reboot -m 256 -kernel vmlinux-4.14.167-mac-backport+ 
> -initrd sysroot.cpio.gz -append console=ttyS0 

Yeah, it's looking like it's something about my userspace build. (A problem
which is unique to m68k because all the other targets are working. Sigh.)

I'll keep digging...

And this makes the segfault go away:

--- a/toys/pending/sh.c
+++ b/toys/pending/sh.c
@@ -2575,7 +2588,7 @@ void cd_main(void)
     if (to-dd>1 && to[-1]=='/') to--;
     *to = 0;
   }
-
+write(1, "", 0);
   if (bad || chdir(dd)) perror_msg("chdir '%s'", dd);
   else {
     if (pwd) {

So that's reassuring. I should run it under gdb to see what the segfault that
heisenbugs acutally _is_ but given it doesn't show up on any other architecture
(32 or 64 bit, big or little endian, sh4 cares about alignment, and I've built
it under glibc musl and bionic), I'm going to throw m68k back on the todo heap
for now.

Rob
