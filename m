Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5090C48BE6
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 22:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA9AE61183
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 22:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhFNWNT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Jun 2021 18:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhFNWNS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 14 Jun 2021 18:13:18 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18405C061574
        for <linux-m68k@vger.kernel.org>; Mon, 14 Jun 2021 15:11:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o10-20020a17090aac0ab029016e92770073so955423pjq.5
        for <linux-m68k@vger.kernel.org>; Mon, 14 Jun 2021 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jAnoEISI0L2OXGy96apZSthRcMdJs90A0Scf4hR9OWU=;
        b=vZdSciB4bh4s9msC6E2WbnUdR1Jgz5LJiAGndZe7zs5+YinzmY9eKp+mlJpeGMH9k0
         z880monRkkOg/hG24PEFEd8LmjOrQYQYbxcBN2qrKeQzrXwZ45oX9alW9bua2M6FHcc0
         mIqPT+mTM/nIsBIsDuic2+CZl1/1DGWzZFyBuxIdiWXFivC6OKp4pRzPB1RHT7uyFghy
         ORfMpw5v5BsHbdAS8qEWCba+6ZUwEit/kGOImxB4tsVyWGkSXMakkn3icW4p+/6I9JKd
         xcFCRlPpyZE01vIex57KRSP0rAlWCPJ1hS1DLEd2hke+KqR1sEOJunTu7FWswnodqg5w
         t1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jAnoEISI0L2OXGy96apZSthRcMdJs90A0Scf4hR9OWU=;
        b=Vf4tx4FrPhqGU/OovVWxzIKsPENzhfDhMUIs8pgkMeHOzDCvLsOUnQ51YF+DH+Nw+a
         zyZW4Y+bTw5m8OqBJJ0Efn5wWgTk3xHpui+Ea5fw2qoWv/cA2dCb7aMTElnsF+h82npV
         T4SImeXCwnOGAQQTSsXAg0WYNVsYu+s3BUrcMb3HvygYuc1OV4aFiMrsjr80JJUGwaSR
         DO+z8ODpP+6jWVdaHDQEGXfujgBvQfuWJovQP9mDKktpbYQRpClsJFdlUj6ipzlLbDXA
         TtFEs74/RXffc4FnpOu0aT+sqbXaFg3DbmoYhPcoKZKI7XdClB2JYDNU0yhvMdJdxMGA
         qcBg==
X-Gm-Message-State: AOAM530TOTAHn18VWoX7apLThHeqO5WMb+tOJ3NMQu0c2gVv1Nq1fj3c
        AwYEwUZUYWZPZFsH9kvk4pApH7W0qmZggQ==
X-Google-Smtp-Source: ABdhPJxz284kbgly9xGyxKcxlv6yUh95MHD3htllr2sWt488c+/C3VmqckKFUKnviwdoPmtpOa88uw==
X-Received: by 2002:a17:902:b288:b029:111:4a4f:9916 with SMTP id u8-20020a170902b288b02901114a4f9916mr1279694plr.24.1623708666506;
        Mon, 14 Jun 2021 15:11:06 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:108d:81dd:b77d:48cd? ([2001:df0:0:200c:108d:81dd:b77d:48cd])
        by smtp.gmail.com with ESMTPSA id p24sm13794185pfh.17.2021.06.14.15.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 15:11:06 -0700 (PDT)
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
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
 <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <76e2f396-ec94-2615-4fea-0f33f6564f19@gmail.com>
Date:   Tue, 15 Jun 2021 10:11:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

working on entry.S recently, I was reminded of this one. It's never been 
applied, and I can't find a trace of it in my tree.

Not sure how far Adrian got with seccomp support testing, so I'm 
uncertain this is still of interest ...

Cheers,

     Michael


On 28/08/20 8:58 pm, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Aug 27, 2020 at 9:29 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 27/08/20 9:19 PM, Geert Uytterhoeven wrote:
>>> On Thu, Aug 27, 2020 at 2:08 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> On 26/08/20 11:23 PM, Geert Uytterhoeven wrote:
>>>>> As your email subject didn't contain "v3", b4[*] insists on picking up
>>>>> RFC v2, and refuses to pick up the latest version, even when forced
>>>> Argh - I thought that since the first two were tagged 'RFC', I could
>>>> just restart with v1.
>>>>
>>>> Never heard of b4, sorry.
>>> It's the new tool to download patches and patch series, adding
>>> automatically any received *-by tags, and the Link: tag.  Makes my life
>>> easier ;-)
>> I take that as read. Rather you than me :-)
>>
>> Do you want me to resend this as v3? And any preference on the branch
>> test (non-zero, or -1)?
> No need to resend, unless there will be a v4 ;-)
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
