Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E660BC433E6
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Feb 2021 21:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBB8F64DEB
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Feb 2021 21:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhBOVbc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Feb 2021 16:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhBOVb0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Feb 2021 16:31:26 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB3CC061756
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Feb 2021 13:30:46 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id r77so7656821qka.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Feb 2021 13:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/ZVUXlIXARs+8uXUZ4VUGe97t/0+FH4zGariG/23quw=;
        b=oYNPrcJWdwYDcjfr7BRtAMS1ZsIXADGqMxANcWv4k/DopQuXeqYdiTElcc49nNE8qY
         Yk1qhDCBEziQr03O3cdRQxqrMoCXCuyUhJh+t/9tAsP2rJTyzUk4iL0HbQwt5ZkDsORd
         QO3GwJHoN1hy01k8G8HRQ0jiJYumQo2qotPTWeCY+c/o4NJ8SCuMt6le81Wl+BHDOFSJ
         NMUxmsOF3Qi81GJU27WtG8bwB/0POcex15oXQRskGeXUcEhrxkXNX2oyBx24M2MMslET
         XZC0wGQLpf1OV3jgX2AkouJ6ZDdqMePIuj7AFc0JFZkwwqyZTIUuDkIfFOortZX59Aoq
         Kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ZVUXlIXARs+8uXUZ4VUGe97t/0+FH4zGariG/23quw=;
        b=k96R4UPgES2W8+/3CcTPdPxOwS5ij1dp5Ov2wQyJibaXFphz+Z2wr7JAc2dySW8Ig+
         eRIkRb5ECR6Qho1HShJPNAP0IaOedmKZi0EsGGmPAxQyVbbd5+1CBcF6+z/0pI764Nxy
         LuJHHdTomCh7pqou475jeblGs3kcNdu3xiPvQ8awBQ9g+D9pGlTnt008zmKZ8nooQBar
         AvewJCy8xqi5OoG4Rr5zfyX9W7gsqSJmCUYBCuqAs8Jf4I7dEQobtb140mPY7IcD1q9B
         FBxNnqsTGH06Ryi/NJ64WneEF72KRTEXCYZmT/ppDbvvajtCXFP3bjhGE2XbNt4FFiKz
         14iA==
X-Gm-Message-State: AOAM531tqDlhKLx3/gimH7WCm1sYLwaMmRgJpPgwlcFYpIJfKG4itMBH
        5WUz0PQhON000onTwJRDshTK4Vj0/MxP9w==
X-Google-Smtp-Source: ABdhPJww+HEbybVa+NuUj1pReo4TCwVy8br4xX0cmIo5Fn/aZvp3joZCCkrRkQAmV1/YWqIfdDubsQ==
X-Received: by 2002:a37:8a04:: with SMTP id m4mr16638337qkd.78.1613424645583;
        Mon, 15 Feb 2021 13:30:45 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id a145sm7038704qkc.125.2021.02.15.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:30:45 -0800 (PST)
Date:   Mon, 15 Feb 2021 13:30:44 -0800
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Joe Perches <joe@perches.com>
Subject: Re: [RESEND PATCH v2 0/6] lib/find_bit: fast path for small bitmaps
Message-ID: <20210215213044.GB394846@yury-ThinkPad>
References: <20210130191719.7085-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130191719.7085-1-yury.norov@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

[add David Laight <David.Laight@ACULAB.COM> ]

On Sat, Jan 30, 2021 at 11:17:11AM -0800, Yury Norov wrote:
> Bitmap operations are much simpler and faster in case of small bitmaps
> which fit into a single word. In linux/bitmap.h we have a machinery that
> allows compiler to replace actual function call with a few instructions
> if bitmaps passed into the function are small and their size is known at
> compile time.
> 
> find_*_bit() API lacks this functionality; despite users will benefit from
> it a lot. One important example is cpumask subsystem when
> NR_CPUS <= BITS_PER_LONG. In the very best case, the compiler may replace
> a find_*_bit() call for such a bitmap with a single ffs or ffz instruction.
> 
> Tools is synchronized with new implementation where needed.
> 
> v1: https://www.spinics.net/lists/kernel/msg3804727.html
> v2: - employ GENMASK() for bitmaps;
>     - unify find_bit inliners in;
>     - address comments to v1;

Comments so far:
 - increased image size (patch #8) - addressed by introducing
   CONFIG_FAST_PATH;
 - split tools and kernel parts - not clear why it's better.

 Anything else?
