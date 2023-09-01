Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D182CCA0FFF
	for <linux-m68k@archiver.kernel.org>; Fri,  1 Sep 2023 21:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350809AbjIAVqZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 1 Sep 2023 17:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350836AbjIAVmy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 1 Sep 2023 17:42:54 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8993B173A
        for <linux-m68k@lists.linux-m68k.org>; Fri,  1 Sep 2023 14:09:20 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34e1ddc38c6so546705ab.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 01 Sep 2023 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693602560; x=1694207360; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+B2LETBRYo235Gzl9s8FV6KtOjZrwPltfhhztkFxvM=;
        b=Tt2dMz5ahFZszmTH66pmuJr0l5SX19yr94/CTG4ClUrmg1Z6gn/vKEL9gj9Akohviw
         q/lWu4+7HZwoHeN0A4MNCdKtKZn3FGtUNvMEHJVl07pzAhzpQ7b0zmOzW/UczdG7qHPE
         3PLV0LBOK/GNoUkDHX7pBKZ7vW9IUVDLKThLS9y+YnCFhANb1wDpLR6ucohjDcJrme6P
         iz2zwhy3IG413DYvxgzuuqToYwOV6N81SAZi9laGVJxL4XlekUxBpBrAZpSFTEhh8LAI
         60fza+TR5mZJp6FhdP6AQMGoygF6YXVwul7s0XNHBLJJz9F6Ab6cKLR6lyOfQzcvxBOo
         mTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693602560; x=1694207360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+B2LETBRYo235Gzl9s8FV6KtOjZrwPltfhhztkFxvM=;
        b=WYzNU6L38CCb0Kong0gy4C6uiTCK+vojAowW+ZkeLUVPa8F0kAsDEEExZJ1alWQitn
         xIreaaDJR2nRbv/1zoF/xAfww60oqRHMWTmUH1eYh7oz9i67a+JfiU4YFP4AGz4gUzHQ
         +B4K/DMOCJC2sQqAYqftyQnXDAXqJUj4CSoUaxhVGAspe++Cv+C4khx3vKQStiU6SdBk
         gS41ucOMyvwixOcO16EcU7sYyW2dKAIQAhhBven0Q/9YR/ceHc8fMdVG0tH5efdefO4A
         UDnOouTST5NaTsKR1gp7jFL21drzR8U/FQypKTrDvU3WKNBmUd4aV+Hqiv1C3XUjrDFX
         +6JQ==
X-Gm-Message-State: AOJu0Yz5FQB/jRCfQpwG44CHIfBbdn42enO0h3ujDMCFichAQm9qe/pN
        lSIfWoqC+JC62LBTlaz/TUk=
X-Google-Smtp-Source: AGHT+IFbTKv1w6p0/+A5JTx82UybC+0oJ7K12y3+bx6yQvYDtzUEGH7puVOtPVweviTp68q8AP2PlQ==
X-Received: by 2002:a05:6e02:1062:b0:34c:cf1f:2a27 with SMTP id q2-20020a056e02106200b0034ccf1f2a27mr4042401ilj.0.1693602559809;
        Fri, 01 Sep 2023 14:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f11-20020a056638118b00b0042bb2448847sm1257257jas.53.2023.09.01.14.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 14:09:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 1 Sep 2023 14:09:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nikolay Borisov <nik.borisov@suse.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>, semenzato@google.com
Subject: Re: [patch 17/17] x86/fpu: Move FPU initialization into
 arch_cpu_finalize_init()
Message-ID: <e0399977-5978-42cd-82cb-67b81f285498@roeck-us.net>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.902376621@linutronix.de>
 <ba1b11e5-b3f0-457b-8920-d57d470626c3@roeck-us.net>
 <6a09294e-2c07-585b-336b-20d07e7e08ba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a09294e-2c07-585b-336b-20d07e7e08ba@suse.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Sep 01, 2023 at 09:02:19PM +0300, Nikolay Borisov wrote:
> 
> 
> On 1.09.23 г. 20:30 ч., Guenter Roeck wrote:
> > Hi,
> > 
> > On Wed, Jun 14, 2023 at 01:39:46AM +0200, Thomas Gleixner wrote:
> > > Initializing the FPU during the early boot process is a pointless
> > > exercise. Early boot is convoluted and fragile enough.
> > > 
> > > Nothing requires that the FPU is set up early. It has to be initialized
> > > before fork_init() because the task_struct size depends on the FPU register
> > > buffer size.
> > > 
> > > Move the initialization to arch_cpu_finalize_init() which is the perfect
> > > place to do so.
> > > 
> > > No functional change.
> > > 
> > > This allows to remove quite some of the custom early command line parsing,
> > > but that's subject to the next installment.
> > > 
> > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > 
> > The backport of this patch into chromeos-5.10 and chromeos-5.15 via stable
> > relase merges is causing various Chromebooks (not all of them) to crash
> > early during boot. Subsequent fixes have not addressed the problem for us,
> > so we already reverted the patch from chromeos-5.15 and will revert it
> > from chromeos-5.10 as well.
> > 
> > I don't know if this is a Chromebook specific problem, or if it affects
> > mainline, so this is just a heads-up in case others experience similar
> > problems.
> 
> 
> Another thing - if you choose to revert the arch_finalize patch then bear in
> mind that the GDS' 'force' option is rendered inoperable as the FPU can't be
> disabled due to the way things are sequenced.

I understand, but that is still better than not being able to boot
in the first place.

Thanks,
Guenter
