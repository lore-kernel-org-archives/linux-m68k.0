Return-Path: <SRS0=O3TF=CF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0499C433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 19:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71E3C207CD
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 19:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABP1aBVN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgH0T3v (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Aug 2020 15:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgH0T3u (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Aug 2020 15:29:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354DAC061264
        for <linux-m68k@vger.kernel.org>; Thu, 27 Aug 2020 12:29:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i13so3170872pjv.0
        for <linux-m68k@vger.kernel.org>; Thu, 27 Aug 2020 12:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rO9CKipDkZG8yWZ1GR16Y5zEchtGzefoA2mnxKLGNMA=;
        b=ABP1aBVNQ+cb4/+qVkRj4xM2ONV2y4//Ga1JSIiKmOcJlO8GqKc/ZS5/K4q0MAZOMV
         vJ6OQzTwaFLNEeNNnUXcjQYy2roFcUlO8NHbpE6BDCmrUyPaQzZE6MX1zR2K9ahulgUw
         kMP6HkpsTzcQrjEM9C9E5TmC7GT9ihS7BNlff+JZZ3oQQG/OAYKCA0WxxQmX6crZ0L4V
         S40Y2zU69JbvVEOi90WB75U5ACI+Z6xpMWz3WZKdVb1lb4xE01ReT41ew2mHTISgX9mA
         /9kFod3UP6d+/3dHel/9OfZOJVA0ECd30/Hx2tFzVo7+8egeRuAEOg2t5eKwNwwZ4I5L
         y5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rO9CKipDkZG8yWZ1GR16Y5zEchtGzefoA2mnxKLGNMA=;
        b=hKjv+wF+uWGSjWlLwOO8pM9dn/uGfOg/aYK44jo/4Wyr8QHxCgdIlCPzvSfoNYTGsl
         fqW6BmKdVVsPEpoAng2g3rH8kv3zwZ353xey0urgP2/i1Wv1gXUxDV8RNc0sEK+ZWyG0
         0g5utg52BU4SOM2aQzC+6aIdDKoaP8bjSFhuqQNSlgKdJYHeUwAXex0fwm0Zr6I7rsqq
         NQu2Wl0DSSWmYZwPuZu1GjLKO+uAme7MGg7DQv665Cm/LSl+V4LCBBZCVudlh50vdP0A
         yj9udhwlwSB8/po5tdFg5mryQ6TFQhU1f/cjY+gTQVsVadDBQ7Rwwp5a9oF85R+vfD7u
         TR0w==
X-Gm-Message-State: AOAM530NCEXCyS+H75bzok/mW50pjaj3cBdNFUA5ViUWi7Xm2d8L3n0I
        g6rdj1RIB663jH3L7cooMaNyBwkB24w=
X-Google-Smtp-Source: ABdhPJwTsxx5BISivu6F5N3ZklZMETBzA2rWPnK/TiyC+Xk0FixenK6eF8EIdf/ZnYWYJ8eaT2nP8g==
X-Received: by 2002:a17:90a:8904:: with SMTP id u4mr338852pjn.87.1598556589846;
        Thu, 27 Aug 2020 12:29:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:d930:b273:4f3c:9cc9? ([2001:df0:0:200c:d930:b273:4f3c:9cc9])
        by smtp.gmail.com with ESMTPSA id y13sm3576598pfn.214.2020.08.27.12.29.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 12:29:49 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
 <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
Date:   Fri, 28 Aug 2020 07:29:44 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 27/08/20 9:19 PM, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Aug 27, 2020 at 2:08 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 26/08/20 11:23 PM, Geert Uytterhoeven wrote:
>>> As your email subject didn't contain "v3", b4[*] insists on picking up
>>> RFC v2, and refuses to pick up the latest version, even when forced
>> Argh - I thought that since the first two were tagged 'RFC', I could
>> just restart with v1.
>>
>> Never heard of b4, sorry.
> It's the new tool to download patches and patch series, adding
> automatically any received *-by tags, and the Link: tag.  Makes my life
> easier ;-)

I take that as read. Rather you than me :-)

Do you want me to resend this as v3? And any preference on the branch 
test (non-zero, or -1)?

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
