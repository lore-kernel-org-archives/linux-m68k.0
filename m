Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168F3C4338F
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 07:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC38961214
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 07:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238926AbhHYHwo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 25 Aug 2021 03:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238693AbhHYHwo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 25 Aug 2021 03:52:44 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB55C061757
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Aug 2021 00:51:59 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x16so20550234pfh.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Aug 2021 00:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2EVv4M3Q0HoLhSmEct1EZ11arCURP7bhpV+6UeV88lo=;
        b=U3Jh/CO59SzMnMvGDXxAyYCFG9fog53kMbRK67siw7zxCKWjyOaAm4Y/8/AgiSjbjY
         9KK6qvElzNEbCS8NH46uib6PFP5BCpnKNFeutcGKSEo/DxPeynJ1e9BWiUFz0gujijnp
         OgjAH/7BIFqiCErZr3+VhrjJAB+ugm+lWj87us836SeF4VvjCsDEmmSppPC7cn0Bp+T5
         W6ow0geNg1dOVm9i7Ag/3IaCvrGneAeM0EJ3H/aa6GLm7NRKTOWdlDUdl7K2ENfj8r9S
         J7f/4KXkRQJjl7yGn/s3ioiArOS1Zes3SqE/FevIN4uX+gwBKVOKltC/ZNMTZp9ggsZF
         XakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=2EVv4M3Q0HoLhSmEct1EZ11arCURP7bhpV+6UeV88lo=;
        b=KEttDlkc+fgXAP8wfIoprupZi4jkgHjIk2gIeB9BLLmXqQ0cu4OerDaJ6VZ8Dxw+C2
         MG75lF+v2QQxe5gNLDcFkD9mWCBefj3NuTysz9l6vpfVpFs6axeL07/Mb7G2mEHEliXM
         pRljPlDG1c0Eckmvv7Tq3A7AQQ2OjQlm51+vgq8fb1sPYfwUXt8QawrUtYpuEgnahos6
         yI/5T/ynXC6XwsYqfPbiUZDjfrfk9zNt8ms9aX0mKgFeq0Z8QDOkbkLPwYUGqQqYjUzz
         A85YvGIK1hzhS5J7MXfzq70IE71w9WFvXxIMzw/zmRbeVbpfWKC4ZM/fCkdEGveAfEYs
         YRig==
X-Gm-Message-State: AOAM533w6hKKefQcc9NYPzVU0voWX0HyqrqLwa1lpH9ac/xIRAMCVEGC
        j2fCnAAWImn9hsactiyxZUaFDXMSRD8=
X-Google-Smtp-Source: ABdhPJyA4e2wsv1xptWwdUZH9zosxbzC09I1tyDCqNLbp5GAAt7yD97QXnJel7B59jCyVDCuFiGPVg==
X-Received: by 2002:a65:448a:: with SMTP id l10mr40442735pgq.313.1629877917212;
        Wed, 25 Aug 2021 00:51:57 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id f5sm5054608pjw.20.2021.08.25.00.51.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Aug 2021 00:51:56 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
 <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
 <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com> <87bl5n9q1e.fsf@igel.home>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <208ad46d-e4ef-68e3-97d0-aa7756852a92@gmail.com>
Date:   Wed, 25 Aug 2021 19:51:11 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87bl5n9q1e.fsf@igel.home>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Andreas,

the manuals on the NXP web site don't have the exception frame format 
tables, but I found a copy of the PRM at U Ohio that does.

Casual inspection of the old format errors at that same rte instruction 
shows it's always the same format code, and SR always has the supervisor 
bit clear. No pattern that I can see on the other contents of the frame. 
I've seen SSW and ISC all clear in one case, that can't be right?

Cheers,

     Michael



On 24/08/21 20:59, Andreas Schwab wrote:
> FWIW, you should be able to download the full 68030 user's manual (as
> well as all other 680x0 manuals) from the NXP website.
>
> Andreas.
>

