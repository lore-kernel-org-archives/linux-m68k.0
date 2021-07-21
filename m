Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5833AC12002
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 19:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 282706120D
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 19:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhGUSkI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Jul 2021 14:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhGUSkI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Jul 2021 14:40:08 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B76C061575
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Jul 2021 12:20:44 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso357796pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Jul 2021 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xRYcQ7CxI4D7fWwtTo30HyzlLAiMr6tsN7BH6ZrhYsQ=;
        b=lsWJzOmmb556oTec7KZXacQQ5q8r32AENe+oZl1wOXg5xk65iczTxNKf04kDtV7zps
         fLmaA5lIn9CJIGz8JkD27bziRkhaylQLqULlr0Va0PdgAujKl2qjpmntWz4V7Jyk7y/3
         D97crG51SWIYVRFNhDR/IpbZdpKmhKdg5fDIUys+vW3Mx7jfLERdIdM4DkZBLuqFf6Qa
         igh/G45QnvBZ5zUAIJ0kpJ1+aeV4jxbNbpj0dbQ5NPTsYooPjtMrkjY/ZwqjG86m6jcd
         NxUkURMFAinyxcTGX1OXKYITvsp9ZwK9yRz2uBfYTQH1pt3SqIyMVNYOokbV1+grAGbH
         MRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xRYcQ7CxI4D7fWwtTo30HyzlLAiMr6tsN7BH6ZrhYsQ=;
        b=WKiG4BG9U1027kXhaRMrAiFU0VAvjm+C3bWZZuwWaWNJNGibt5xh+t/SCJKaBzbNBf
         zJ4zOcr6BbV37Xti6uo4n5ku5VPV728nKdf79yAplyYILnozky7XMJ2Mj3/jZ/+jBlMW
         eHJQglpGzBjOktm3tFxHnHKiinoJdiEAtxvOT1BEMJlLQwRs5T6qVCknc1B7GTob0sty
         OVz7f2JxzAeittLfFki0N9pFfgGmY382XoFWDtl8s9D8K6HNzCKspPAm7BsHcttrbkCf
         SqF5VtPVwNC3EMPdey+59lRR/0sZwBDVYKWeqxB0OQkAOfVJY996T2NoHlgqk2HYTCs6
         dN/w==
X-Gm-Message-State: AOAM533TCAWJ28zo+ewYmKEOw1SC9rzfHpvWWmSGIvQCVysBR8Q8z91B
        pNMPi3NoelSr0gkPimzUDHc=
X-Google-Smtp-Source: ABdhPJymbR7NsQRfAabWnYttxtqExcibszWiWgNMecfqKDu01Z0li8PQL+Rv6Y3Xxn4hGky5ktiyuw==
X-Received: by 2002:aa7:93a2:0:b029:333:64d3:e1f7 with SMTP id x2-20020aa793a20000b029033364d3e1f7mr34566711pff.25.1626895243587;
        Wed, 21 Jul 2021 12:20:43 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:d1fe:cb2e:7c81:3f98? ([2001:df0:0:200c:d1fe:cb2e:7c81:3f98])
        by smtp.gmail.com with ESMTPSA id u23sm33491262pgk.38.2021.07.21.12.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 12:20:43 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
 <87fswjomtm.fsf@igel.home> <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <42b07284-db5c-9515-8d75-aec65a152e11@gmail.com>
Date:   Thu, 22 Jul 2021 07:20:38 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721170529.GA14550@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 22/07/21 5:05 am, Christoph Hellwig wrote:
> FYI, I've pushed out a new version - this contains the fix from Andreas
> and drops all these uninlining tweaks as they very obviously cause more
> harm than good for now.
>
> And sorry for the delay, life has been a little busy lately.

Thanks - after Andreas' patch, I didn't see any more kernel panic. Will 
pull your new version and give that a good workout.

Not to worry about the delay - I could use a little break from Linux 
testing. Hope you're not too badly affected by theb extreme weather 
events in your part of the country.

Cheers,

     Michael


