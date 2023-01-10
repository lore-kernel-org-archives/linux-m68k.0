Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694E5C5479D
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 03:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjAJDFz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 22:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjAJDFx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 22:05:53 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBCFF24
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 19:05:52 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id r18so7271668pgr.12
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 19:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=953SSMiTXq/ErEALmsG7xI2i9t9THhndyttEn3EomYA=;
        b=NURXE+1MSvz68y9V6RrFsHgSBO7oKfPsiTIINRZ7UVGt3SAy6MZziJO2RmnH611e6p
         NfT6rp+Qp1n75lFjHs9+JToDpMQDwFiMixDpFjeUfHczYDuWZTDl79XGRRIR/N8wVtPm
         wMMEV/QZSMWzNRGVCP+CmsXP5m7WXvUWSpZXLfrtxeUTQDYfSEZSq5sqS8lHt6uOqinz
         gADVtxAee8t4urZF04VENZgFejVwSUecgjU6L+gpyYlt0OJlbDK/g014gg/FvNzcZgzb
         v2vYvpNHp3lbao7sxztjGM2DlUXJHs6fpUPZjnzQwXslZhHlY6dzNkCG4dHLOEcA4mDT
         cxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=953SSMiTXq/ErEALmsG7xI2i9t9THhndyttEn3EomYA=;
        b=i0jl6twHBtiN9mUQ0/t6X8kjMHEp97UrVJrnU84sBG6mXuF0rk8yssusCLAKAriD5N
         nKB+dK70y6ly63dsT7IKlUlScSZ1xtx8Mw6Xt5QNJnSQi2pb+nir13zj7Jz7UpaaTv4c
         /O6rQG1aiYvp7f4yLmx0slhETF/FHdbto9tWwQSDSXjGWGbg4BYgbOyV8mFTxBx7FsKU
         QFxIP+WLHUegm0Ta1MnF9e/aK7//E3tEa/NPC1UdPv+W1eiB/xUXGre5Xsjl1RYoILKn
         TgaanQXV7RWTE3K/NKfsrkzrEu8vBsFyakCHc3+ND1vxyACPppq3floU/5rSCx4aBU1U
         33nQ==
X-Gm-Message-State: AFqh2kqusWNDyPrH5//FGVBE0sX03vJ694/6hZ6I7ZgJ3WC68B1noYzR
        WOFwqQHoYjHpCCDyrAPEOMCh9JScQsM=
X-Google-Smtp-Source: AMrXdXuindipT83lrB3oJrjGQpqqt2MeYG36ehHUnE56AePTiQww7k7vKvuAbnv4RC3LmYTS8QkU0Q==
X-Received: by 2002:a05:6a00:f92:b0:582:a224:e740 with SMTP id ct18-20020a056a000f9200b00582a224e740mr27037551pfb.27.1673319952027;
        Mon, 09 Jan 2023 19:05:52 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id i5-20020a628705000000b005813aec74bdsm6735672pfe.139.2023.01.09.19.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 19:05:51 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 10AD7360205; Tue, 10 Jan 2023 16:05:48 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de
Subject: [PATCH RESEND v11 0/3] Add kernel seccomp support for m68k
Date:   Tue, 10 Jan 2023 16:05:43 +1300
Message-Id: <20230110030546.21688-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

[Resending after removing yet another leftover merge
conflict - thanks to Finn Thain for spotting that ...]

Patch 1 from v10 of this series is now merged, so patch
numbering shifts by one.
Fixed a merge conflict in patch 2 (caused by change from 
tracehook to ptrace API. 
Added m68k seccomp self test support as patch 3.

Tested on ARAnyM, 63 out of 89 seccomp_bpf tests pass.

Cheers,

   Michael

