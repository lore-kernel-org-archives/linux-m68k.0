Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FD8C07E9D
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Sep 2022 13:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbiI0NMz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbiI0NMy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Sep 2022 09:12:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E43B2CEA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 06:12:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 357E761965
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 13:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A79C433C1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 13:12:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZNw/RBL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664284326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xeqoKVuQTklcDGRkpakc3lqX3E8lptgCVV9dK2W4FVo=;
        b=ZNw/RBL1C+L6RSZKPLK7KUS3OlQzhgTUYguZ6l71RA1UXTWyORluU1MKu8RxBumC5UI1N3
        BjdObeKJ28Ixq+XzcfeUE0IBxvX+16nmkDzrxKdnwpgeeb4gBItWLDhwDBq1VfH5Oas75h
        Yqpq2FU3Pbri1z0LV+37Nx6Klt5jyH4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80b40551 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Tue, 27 Sep 2022 13:12:05 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id e3so3539409uax.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Sep 2022 06:12:05 -0700 (PDT)
X-Gm-Message-State: ACrzQf3QkV0uTh/Ot6PyQ0onEjdgoDlw8SX1YDtNtMutUoGsdMZ8kYT6
        oDyZFN0qRqNhPmqX8IaW83P+8z6DsbpVHZHrIyg=
X-Google-Smtp-Source: AMsMyM6oyZP7m+AueNnE2UylYXTOMa+HeEjIqb0xqQVtg9hZivD6jlIyp+PfBMVT5YDpou42KhzqrzjZ6lM/8cz7PJY=
X-Received: by 2002:a9f:3562:0:b0:3d0:ad99:b875 with SMTP id
 o89-20020a9f3562000000b003d0ad99b875mr1888943uao.102.1664284324669; Tue, 27
 Sep 2022 06:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q==_BaqaYR-H68Tzxppbme33bb4fSrU57BVGzk_oBq5g@mail.gmail.com>
 <CAHmME9ooqESMd4Hb_=KTSuYqiDNm3akojo_CdWW6fgd-+J+ZWA@mail.gmail.com>
In-Reply-To: <CAHmME9ooqESMd4Hb_=KTSuYqiDNm3akojo_CdWW6fgd-+J+ZWA@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 27 Sep 2022 15:11:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9rxCP=kmqVbiKrdknrDjfrHOr71E9MXgkSGadF3QZ1DZA@mail.gmail.com>
Message-ID: <CAHmME9rxCP=kmqVbiKrdknrDjfrHOr71E9MXgkSGadF3QZ1DZA@mail.gmail.com>
Subject: Re: rubric to the m68k rng seed rework
To:     Laurent Vivier <laurent@vivier.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hey again,

Here's the current status:

v5 of the kernel side is the same as v4, but without the last patch:
- https://lore.kernel.org/lkml/20220927130835.1629806-1-Jason@zx2c4.com/
- https://lore.kernel.org/lkml/20220927130835.1629806-2-Jason@zx2c4.com/

v2 of kexec-tools remains the same:
- https://lore.kernel.org/kexec/20220923164152.4079868-1-Jason@zx2c4.com/

v2 of qemu remains the same, but 1/2 has already been taken by
Laurent, so excluding from list:
- https://lore.kernel.org/qemu-devel/20220926113900.1256630-2-Jason@zx2c4.com/

Laurent is waiting on Geert to merge the kernel part before he merges
the QEMU part. And I assume the same is so for kexec-tools. So Geert -
next step is yours.

Thanks,
Jason
