Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB37BC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 05:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A50FA61447
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 05:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhGIFuJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 01:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhGIFuI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 01:50:08 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6B4C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 22:47:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id h1-20020a17090a3d01b0290172d33bb8bcso7632375pjc.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=LRywOj5ijWVnusx6YyVJ+VPaFk5QDROcAlRxI7AJNL8=;
        b=Z1QYJ/JCvR3ukRg8X2kKoYwS1PftBtUsTAfeAcpKyZ4XqBe2xbZ1FOZINSBIK4jS+0
         ZhoZRgBdieCohy5Zv7CBjqeWzZM8emGJPsdjfxjyfDyRw/U2HrSGY9T/Ctae6fdvVSfp
         QeFSRlCLAA16Z+d3CS403jGfczZW1cJlUEVYluc7k4qzV/7N5NrxZoiFLQutvN2en3YE
         Ba+vVzsBcS3SXZGOnwjAwlf1NMWSRYxgZpE04unbP0V4Q55GiLsFaH1lYd7w56AMC8mU
         lKeVnEGbDOdOE+zZCTBvQbG+lvl3F/v+dyCDWrnx4nK2rsySyb9RfsZtMLENwtKRm6z4
         xVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=LRywOj5ijWVnusx6YyVJ+VPaFk5QDROcAlRxI7AJNL8=;
        b=nyZq/i3Djp7nngMyTVVhiPjNO7jLS6SdyAdtIfbjDJC/0Slua4nciUkLCry12Rpb4T
         yfzLYCFtXLNyBUPRREWS+z+RPRrZmv4SKfS0LUarahjZ8B/UqUcKptps6q31p54IbBKl
         ZnIBC/n2oygpCNSk35rk2pBlksAP+BbSYsgK7n3xNyk9WVrw3rNOhtyn5sTYr46rIrA7
         JnIVYsj3C0jeUOXcw9ZFdWNTAfj9TDMJ7gBAMBF2M1DrXc2dGi5OX0ZUAXi67JzaCdMk
         A8fFrtDJ+fusVNvTMSnfoNYRDDPZI19dflI5P+eaiNaDlUJ0U3SXASddujNKPVeAqkJt
         5WzQ==
X-Gm-Message-State: AOAM533ZMSdjRhlAY55AJM49SfO/RDtOEMI1aBO83Im+jkxSrGD8Qrix
        UqYYszDerbYwIzfkV3JquGl9QkDAjTw=
X-Google-Smtp-Source: ABdhPJyU2utK+EIsqxVObj5/aFIFvpGnlUzwMWpUXGDqW5QTj4ZyIDd3y6sVFN4gQ7TGDvLA8aMtMw==
X-Received: by 2002:a17:903:31d1:b029:120:2863:cba2 with SMTP id v17-20020a17090331d1b02901202863cba2mr29589046ple.28.1625809645107;
        Thu, 08 Jul 2021 22:47:25 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id r13sm8246894pjj.9.2021.07.08.22.47.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 22:47:24 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
 <20210709042219.GA13558@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1f4dde5e-2038-f0db-832d-b8dde98a52f8@gmail.com>
Date:   Fri, 9 Jul 2021 17:47:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210709042219.GA13558@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 09.07.2021 um 16:22 schrieb Christoph Hellwig:
> On Fri, Jul 09, 2021 at 12:31:45PM +1200, Michael Schmitz wrote:
>> That patch works fine on a casual test. What you did to
>> __constant_copy_to_user() does not appear to matter - but I haven't put the
>> system under any kind of stress yet. I'm a little reluctant to do that
>> (recovering from a trashed boot disk is a little dicey), I'll probably only
>> try that with your changes to __constant_copy_to_user() from commit
>> d36105c942e0 backed out.
>
> As Linus pointed out, small copy_to_user basically doesn't happen as
> we have switched all the suspect call sites to just use put_user.

Thanks, I missed that. That does explain it then.

I see you've put a warning message in set_fc() - let's see whether that 
triggers on a test run on real hardware.

Cheers,

	Michael

> Geert: do you care about __constant_copy_to_user at all, or can we just
> kill it (as well as the copy_from_user side)?
>
