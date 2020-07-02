Return-Path: <SRS0=rKVK=AN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE30C433E0
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jul 2020 06:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2095D2077D
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jul 2020 06:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593670490;
	bh=TRjOq0ioBsI/lLgnqh3WHyq3NuAIqhAPdkGT9KrgKH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=DxILJygFHox+fmBVOIExRXzVH45d+XSqHVLf2fgtMNHPH4weBVWy5A1jcK3QQr5YB
	 evQaT7Adt7Nu8W9pjFT+1x6UuolQ+idKxfdxW/PLDWkatiy01/EeIedmS8gd/bOsm7
	 ME4pzz6r5uyDFRUPLL3dgfwt8Dd4fzGdcehSQXfQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgGBGOq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Jul 2020 02:14:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbgGBGOo (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Jul 2020 02:14:44 -0400
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 243042088E
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Jul 2020 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593670483;
        bh=TRjOq0ioBsI/lLgnqh3WHyq3NuAIqhAPdkGT9KrgKH8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yItMbcctXfs5o3K3a0Uwam0VmikvvsUcR4rDa/JwGQwZB8Uz/Yhp2jGzCMiYmIUEm
         4zPuCUnKKcbVFIxEfBWBqPKPHn5qsYIgU9hyGcq8vCgJNY75/6RU7God1Ttp8qeL9G
         H4psw2naqAuo1p/prO5iO6oUyZzGm17MB9ZSYIN4=
Received: by mail-lj1-f180.google.com with SMTP id h22so23075463lji.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2020 23:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM533me2dH6WzU8tIYWrvto99SwP4Scf/og+oW7OE9z6ZUcSRy7IO4
        +Ow/5PBcZDpQ5ahn8aIUow73cOQ8W97APz/aBfY=
X-Google-Smtp-Source: ABdhPJyW7ZQG/gxodV+UBsSp8muv8lWxec/bTY9tvW0qqCeZQo8oSQL9G2bg+h67AMeeX8NyXrYP1bqMgId6X08X7/E=
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr11256607ljk.27.1593670481513;
 Wed, 01 Jul 2020 23:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de> <20200701085947.3354405-13-hch@lst.de>
In-Reply-To: <20200701085947.3354405-13-hch@lst.de>
From:   Song Liu <song@kernel.org>
Date:   Wed, 1 Jul 2020 23:14:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
Subject: Re: [PATCH 12/20] block: remove the request_queue argument from blk_queue_split
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
        open list <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org, linux-xtensa@linux-xtensa.org,
        drbd-dev@lists.linbit.com, linuxppc-dev@lists.ozlabs.org,
        linux-bcache@vger.kernel.org,
        linux-raid <linux-raid@vger.kernel.org>,
        linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org,
        linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 1, 2020 at 2:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The queue can be trivially derived from the bio, so pass one less
> argument.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[...]
>  drivers/md/md.c               |  2 +-

For md.c:
Acked-by: Song Liu <song@kernel.org>
