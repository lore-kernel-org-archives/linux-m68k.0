Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165ACC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF9F2206D8
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJYkDksH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGZBXi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jul 2020 21:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGZBXi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jul 2020 21:23:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CD5C0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 18:23:38 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u5so7211118pfn.7
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 18:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=IEDT2J/xqegT0M1uz0RvFuU4x4R6j5iu+foEx8EbglM=;
        b=NJYkDksHHkaA37tU6HPI3kpOUrXHj2vSLoWTJqh7fdG63xuSEJoFAVYK9jP1B/+/U+
         n8tPLFTdeJcDbOscDQUf+FQJqBFqIw4wsBg06QU0Wqfi+UzbCPVPy6INxq31H4Qg5cyK
         pb0SAFT6gg6MAkUk2OauSZWqpKlxSTT1YmoTIdpgrjLHLhhTHqUEOXgOxbyJ9I8Rl0k6
         ++4glvz5rw0osW0gpeOCxogcyIpd9abWD+pGXhXQrVXmCNVMMviqY0lxF7AYRPnlsiR0
         kyHoLDk94OQhUaoHK41Cd1E71nvd3h1c6uWz73han7n/yS73bo0p1oywCELJ3ORmS4Uc
         U0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=IEDT2J/xqegT0M1uz0RvFuU4x4R6j5iu+foEx8EbglM=;
        b=BVu6Hj9VTjuA9hl9mwC71kCgUflqA1mR5AObL3N+D7fvBKFJN5OOBFRFKZ/nsLN+1E
         qcBZxRlsDaO1kO+ivFLpfw4gBx4W8D65hZXBlcfZ1pzKBLeq2BUzxm/oGwFOOJYbeVAO
         hZT7/Pq4KeQ1flb8efN0DPxTYJ/HCzSiZRd7eNC1nqri6I4/Nn8rJWMo1Sht5IdDd5x0
         gbTtF+lLw17eJVPIlT6KCIcVU9bdVZXpYwFUC5+XSijhSWm9cOR+u4tXSCmdfd8UUXTN
         MI3i4SpqeSQgC5s2lmBN8GjiRGoOODFslrbDBiT6k4qlOqEVHeZtKIDURaGoLZbTOSpN
         TTgg==
X-Gm-Message-State: AOAM532uMqO0YkRe9xQH2admJIW3nhj3aQnVUeZ4WFYmgSIv/xyeArXp
        R2PPyY36cddpRXZcl3Tt9b0=
X-Google-Smtp-Source: ABdhPJz2DThNh4sIB8lQQf0uDSStNMlvosgRdeWeDBVvNIvJkrNqSn5P7speS5DsNBneGmbhmtvaQA==
X-Received: by 2002:a65:6786:: with SMTP id e6mr13648676pgr.395.1595726617437;
        Sat, 25 Jul 2020 18:23:37 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id d93sm2642589pjk.44.2020.07.25.18.23.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2020 18:23:37 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com> <877durreph.fsf@igel.home>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <80cef911-af86-c49f-5ac3-1cfe7037de80@gmail.com>
Date:   Sun, 26 Jul 2020 13:23:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <877durreph.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 25.07.2020 um 23:55 schrieb Andreas Schwab:
> On Jul 25 2020, Michael Schmitz wrote:
>
>> --- a/arch/m68k/kernel/entry.S
>> +++ b/arch/m68k/kernel/entry.S
>> @@ -167,6 +167,8 @@ do_trace_entry:
>>         jbsr    syscall_trace_enter
>>         RESTORE_SWITCH_STACK
>>         addql   #4,%sp
>> +       tstb    %d0
>> +       jne     ret_from_syscall
>
> Why tstb and not tstl?

No particular reason - I had seen testb used in the syscall entry code 
and had copied that. Missed the use of testl elsewhere in entry.S ...

Fixed in v2 of my patch.

Cheers,

	Michael


>
> Andreas.
>
