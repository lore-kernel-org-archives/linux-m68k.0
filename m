Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D149AC2D0EC
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 21:45:50 +0000 (UTC)
X-Greylist: delayed 162 seconds by postgrey-1.34 at mail.kernel.org; Sun, 12 Apr 2020 21:45:50 UTC
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="fShpm8gM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615F5206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 615F5206E5
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 21:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgDLVnH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 17:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:50482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgDLVnH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 17:43:07 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7695C0A3BF5
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 14:43:05 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id x11so7398159otp.6
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X4JN3I4RgQet+c6zSx+5jOf5qNuQLa/qnprYVfo8x5o=;
        b=fShpm8gMMD16i/Q133LgL1W10TJ9/XNKwDn2l043zykz/8n6liGI7HxIiYL3wl4lni
         DijItgvDjQdaZQ/qH30Ujpd5bDdLFBWljS7tMBXbiNforQVfFBcXQQqzfCLPMTGj74tX
         ORCwpL3KQKYbDRPVp+z9VuZXNWCE/nb/XQ8CqL0nw4jjwfpS+k9V24acrVweqOZ4vUKT
         C2VXPmnqeiK3NllFR2Cz8P2GNdMWWLGoIz6Hv4w8DpuEPRAxZT/YD71qcJYymU0MKsWl
         X3b5AYs3XZ8w4F5Wr369qlE+IoB5UMLB0FhfYeis1YYTf6N+gQYJkv9VkljD2ZwSezIc
         9ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X4JN3I4RgQet+c6zSx+5jOf5qNuQLa/qnprYVfo8x5o=;
        b=eVFI6IzjX433CO9M++5sqClaWSg+oTkntTiYFlvqg+th3pu46s8FSWF7/p16BynVyG
         NBhU1ar6G+rWJAQJdopvaqirDKAOZEZGCtBQ2MT/L5VedzNJvxUtdduK2w6zaWxJSohN
         /qDwJAxXtt2iMYqalUs4QagqjOiGl5+TDhfRVFS9ona5flcuk5CXVo7Rb8ORK12bBB/3
         4ok9OqWUyMY8Mtkyr8d03K+ntsA5GcKM+xcDRcGzTJZ9DNQ6KDHXzR/fKUJlK3okh4bO
         oIklVvm1HeWyn0nQ5zwsgVrgQdM6IozmiaYYWu5juGOXVcE7sgWSVyp9w50V27Wc0TcM
         r76Q==
X-Gm-Message-State: AGi0PuYbiPdQaDQRFs6A4PFwgaoMWHJjAcbakwoLLeKVCZylWA5EApE7
        En20ydcOnrozrDU9z6iENrQMvrwIvw4=
X-Google-Smtp-Source: APiQypILJphTi7Dc+UaGIB/OXzvQoqfultJirHtOjftHJ6HhQ4sQac3KhmKHweqUb6Y8Tts2fY9XJA==
X-Received: by 2002:a4a:d746:: with SMTP id h6mr12015040oot.21.1586727784566;
        Sun, 12 Apr 2020 14:43:04 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id l186sm4339825oia.46.2020.04.12.14.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 14:43:03 -0700 (PDT)
Subject: Re: Running m68k on qemu with external initramfs?
To:     Laurent Vivier <laurent@vivier.eu>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org
References: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
 <08DCD73D-7BC1-4F38-87DE-ED4DBD5978DA@physik.fu-berlin.de>
 <f1f62d19-bee9-537d-5641-8435567fb380@vivier.eu>
From:   Rob Landley <rob@landley.net>
Message-ID: <e0d7b1eb-c577-88ba-e318-a6b3b41f875c@landley.net>
Date:   Sun, 12 Apr 2020 16:48:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f1f62d19-bee9-537d-5641-8435567fb380@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/12/20 3:31 AM, Laurent Vivier wrote:
>>> QEMU is the one Laurent Vivier maintains that's been out of tree for something
>>> like 12 years now, the default branch claims to be "q800-dev" and the last
>>> commit was in december. It still runs my old aboriginal linux system image from
>>> 2014 (boots to a shell prompt).
>>
>> I think most of these things should be merged upstream these days but Laurent probably needs to correct me on what’s missing.
> 
> Yes, all is merged in QEMU master for Q800 emulation.
> 
> What stays in q800-dev are dev patches needed to run MacOS ROM but
> nothing works for the moment.

I confirmed that upstream qemu is Doing The Thing. Thanks and congratulations.
(It had been so long I stopped checking -git when my last vanilla build wasn't
doing it.)

What I've hit now is either a compiler bug or a subtle enough stack corruption
it doesn't manifest on any other platform and I haven't spotted it. I can fix it
by adding a NOP function call right before the segfault, but for the moment I'm
just punting worrying about it until after the next toybox release.

I checked in what I've got though. It builds a kernel and userspace for m68k,
and the _kernel_ seems to work.

Rob

P.S. I should poke Rich Felker again about fixing his kernel headers. He's
switched the default in musl-cross-make to use an out of tree kernel header
package from the sabotage project, which doesn't have s390x or m68k directories.
I'm just going "oh goddess, I fought this war 15 years ago with Mariusz Mazur's
headers package and I REALLY dowanna go back". He acknowledged the breakage last
month, but it seems to have fallen through the cracks. That's what the sed LINUX
is for in the toolchain build part of the reproduction sequence. The binutils
version change is because https://marc.info/?l=linux-sh&m=158544749818664&w=2
which ALSO still hasn't made it upstream, but hey, at least the kernel guys
added an SPDX license identifier to the .gitignore file, so they've got their
priorities.
