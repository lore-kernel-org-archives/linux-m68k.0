Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378E5E95A91
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 08:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbjJIIjd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 04:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbjJIIjd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 04:39:33 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5585A3
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 01:39:31 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a21ea6baccso51837517b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 01:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696840771; x=1697445571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCa60SJYenNTin9ORA6mgu5HPNBKWXiBobv0OFeXlBg=;
        b=wbfwihzIxFYa4f5v1mZMB2qUsxiMoN8ZAceOhqu5AmFXrc1xnEel6tTduoy7Qi5mtj
         uV+xOApWQv3IHo+RKGUqm7mGs0p0ihkpgxJ0ZU9Yx/uOVh2trTwMJ/ad4DUxk0gGWNQ6
         //bmU28dic/SB9/MR5LZzMrdVqgCLLekIvVTsrcTpI5xFa4e9d4hdognX8s1hjDH+ctN
         7Xf7RaSzr0fT1yueRFrPESfSQljpXW5lM4+E9ZSNxtIBcqiIC/+hvEN7legHI4EhMrfi
         iycCfaufSxxs9uLpQMtBAsO/bLegqUhh0bRVtJmVPPleKaJTfz0eS7YE34tSZCopCGgI
         8YJQ==
X-Gm-Message-State: AOJu0Yyv2B46Ksh+LSLejT9y9B3gDX4gHZ7W0CzX53lhVRYoJ/9S0FvN
        Mo2HAf98bcuixgKb0VzTrpEYAcaEnlh6mA==
X-Google-Smtp-Source: AGHT+IGwcNRbujvHRXfn8TkVywJlh/LLOd8QYbw72myMfgN8+dhsT7xDn+4XwSwHH9y4VNpoGnk1ow==
X-Received: by 2002:a0d:f182:0:b0:5a4:3e67:35a3 with SMTP id a124-20020a0df182000000b005a43e6735a3mr14402671ywf.49.1696840770626;
        Mon, 09 Oct 2023 01:39:30 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id t22-20020a818316000000b0059beb468cb3sm3561065ywf.32.2023.10.09.01.39.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:39:30 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a21ea6baccso51837367b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 01:39:29 -0700 (PDT)
X-Received: by 2002:a0d:d443:0:b0:5a2:3734:507 with SMTP id
 w64-20020a0dd443000000b005a237340507mr16135074ywd.21.1696840769802; Mon, 09
 Oct 2023 01:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de>
In-Reply-To: <20231009074121.219686-1-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 10:39:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU281a+=9SApaCRy5os3k73HGZhQ=Fsv58OD4C430iDDg@mail.gmail.com>
Message-ID: <CAMuHMdU281a+=9SApaCRy5os3k73HGZhQ=Fsv58OD4C430iDDg@mail.gmail.com>
Subject: Re: fix the non-coherent coldfire dma_alloc_coherent
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC Greg

On Mon, Oct 9, 2023 at 9:41 AM Christoph Hellwig <hch@lst.de> wrote:
> this is the next attempt to not return memory that is not DMA coherent
> on coldfire/m68knommu.  The last one needed more fixups in the fec
> driver, which this versions includes.  On top of that I've also added
> a few more cleanups to the core dma allocation code.
>
> Jim: any work to support the set_uncached and remap method for arm32
> should probably be based on this, and patch 3 should make that
> selection a little easier.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
