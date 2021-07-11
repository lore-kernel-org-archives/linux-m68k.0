Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE72C07E96
	for <linux-m68k@archiver.kernel.org>; Sun, 11 Jul 2021 07:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF1AC61351
	for <linux-m68k@archiver.kernel.org>; Sun, 11 Jul 2021 07:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhGKHXU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 11 Jul 2021 03:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhGKHXU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 11 Jul 2021 03:23:20 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E466C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Jul 2021 00:20:33 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id a2so14697598pgi.6
        for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Jul 2021 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=HTo9t7kS7RYGqjHdtzRVPlun5C+jf1MtTY+s9fFGkVs=;
        b=bt6q1bwFahJYIZWUAiwRmU1SUGqOd03H7YtDGrxn5GfMPByQ+1Vko83SGUNBF7Nxu/
         RmI+V4dbuvzzEvDu9zIMmu4mpwzLI2jleI48L31RI3UABEPCrIMn6BQdrTOCMa7MQK+U
         87QMwmkQ+DxYMhKz36tjzJx4tGd0gyki3paAXbPMwMVoknPaCcRktfEryDmXN2ypH+Km
         n5FkLuNhPpvDZo7+Z4cSpqq8+rbmh8VnXdbM0KYK6dH8PqL5JxjJdC+fyywizyFi47cw
         3BKuTGM13X9qqP54HkfUhq33e/0eVdaEJGRGm9q3Ev8UVKvgpMh9dN33bDkPy78yRwzv
         dDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=HTo9t7kS7RYGqjHdtzRVPlun5C+jf1MtTY+s9fFGkVs=;
        b=cH5XM6A9w8jpZgMgXK+oxx0KKbFGBuS/224fSqI9yckxJwFMQQft1b52PvS81CuTTs
         DvJ2gql1IgYxto+0rhR0EU9ZUzXJFqcPGAVxn8SXVrTRrv7298s++kLCntmU4uVKAjKy
         ITDJy+tRJWXOzrsHdqVFXtAh7rK9X5xrYvQ+28uKdgOaSGUNcrOTxRB+KPODv54e2uRu
         gYjhCv5yk5U1HLnFlTC2UdOKy29hBK7FsEpIjK9kGwBdIATODQLUFcwq4Fm2OeGGJo93
         UpYOdBarF/Wn0iqk2HsgEQa3aVTr0chUR0sbIi8Z5Ui21HzX1M61UFUT9xFRLMpmJ32d
         L5Zg==
X-Gm-Message-State: AOAM530vfHSnaUdxORVO5pfghLkAQ1KnI+Ngu03yEqAvI57VHvrq9FxA
        066RBiYnq1ASaouP2QKForHeVDdLxA8=
X-Google-Smtp-Source: ABdhPJyvDbqEqH6XIyGPCYRrD9Uas4Fy2SEsnpFiPGqzm/lI/sxo+oCwLzDGN3TRAZTy2D07GfOcBA==
X-Received: by 2002:a05:6a00:9a9:b029:328:2b90:ea8c with SMTP id u41-20020a056a0009a9b02903282b90ea8cmr16235617pfg.35.1625988032045;
        Sun, 11 Jul 2021 00:20:32 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id r9sm16469159pjf.52.2021.07.11.00.20.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Jul 2021 00:20:31 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
References: <20210709070132.3387689-1-hch@lst.de>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
Date:   Sun, 11 Jul 2021 19:20:26 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 09.07.2021 um 19:01 schrieb Christoph Hellwig:
> Hi all,
>
> this series converts m68k to the new world where set_fs is gone to make
> the uaccess routines work on kernel pointers.  Note that it is compile
> tested only and thus needs to be handled with care.

Testing your series, I've got this in the console log:

[16534.130000] *** FORMAT ERROR ***   FORMAT=0
[16534.150000] Current process id is 1347
[16534.160000] BAD KERNEL TRAP: 00000000
[16534.180000] Modules linked in: atari_scsi ne 8390p
[16534.210000] PC: [<00002a8c>] resume_userspace+0x14/0x16
[16534.230000] SR: 2200  SP: d1b6e0e8  a2: 00000000
[16534.240000] d0: 0000001e    d1: 00000003    d2: 00000578    d3: 00000000
[16534.270000] d4: ffffffff    d5: 00000001    a0: 00000578    a1: 00000080
[16534.300000] Process savelog (pid: 1347, task=e3955528)
[16534.310000] Frame format=0
[16534.330000] Stack from 005e9fa4:
[16534.330000]         02108005 0d06b008 1eeeb649 007e0001 00aea040 
003ec318 005e9e68 000279a2
[16534.330000]         000b0000 00000000 00000000 030dfffb 0044fffa 
0e000000 fffa1a00 fffa1c00
[16534.330000]         fffa1e00 fffb0e40 fffb0e80 00049e02 00000040 
0085a800 00000001
[16534.430000] Call Trace: [<000279a2>] warn_slowpath_fmt+0x0/0x62
[16534.460000]  [<000b0000>] vm_map_ram+0x144/0x5ae
[16534.490000]  [<00049e02>] __handle_irq_event_percpu+0x38/0xce
[16534.520000]
[16534.540000] Code: 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 <9f38> 9f38 
9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38

Never seen the like of it before...

Cheers,

	Michael



