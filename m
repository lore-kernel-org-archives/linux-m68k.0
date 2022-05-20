Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1BFC4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 20 May 2022 12:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349362AbiETMkj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 May 2022 08:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349276AbiETMkg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 May 2022 08:40:36 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2A816609F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:40:34 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id u3so6794394qta.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AW3WbgwLSP0WZKYPK3Y6DQ8WAhPkJkHKkMhSdaktb4M=;
        b=KZV4NdGOt55gHsF5kpj+32xI/GkKXiAJQuoFrhzPLtM8gEFL/xdcch90mO0GJAcdG8
         MauZN9yJrykyQaepR3JQxEhfYNx3TV6hTv/wdIBUUWeeHlnWoVVLvv06IlHScEgD5kPE
         jk33Itplm2chTVTeXM4Is8YsU0xsBG+s1xuPN6ayTXRZFq7ZqOW5QT+lyu/pW2Mm2ngP
         XKv6Risrg4d8dub2wmYJ3kxiT4cXkNhGVH1CB4sPK8/jmSb5OADiVcTq2M85/+/C9s1u
         IS1foENbDJa5uCgfsJYtqpTYjbKCTElnBbuhj3AXAev5PyOtykESv6RmyYCpNfyROLzn
         ttRg==
X-Gm-Message-State: AOAM533XxJDFtPbTT9QmvVoLwedDlO4Enwx9ebyHCmXOWo257Gi+yYyt
        0Ic23wQvoI06XmuAYgKrVJTMpKLmL9lAVA==
X-Google-Smtp-Source: ABdhPJyraZU/cEDRhXk1SqPT//MgF9sHseG5kZPTVCFcyJfV0Uc+20jGQK4KCdkMWDk7EeCwBV87DQ==
X-Received: by 2002:ac8:5750:0:b0:2f9:171f:76f2 with SMTP id 16-20020ac85750000000b002f9171f76f2mr4688385qtx.40.1653050433659;
        Fri, 20 May 2022 05:40:33 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t65-20020ae9df44000000b0069fc13ce232sm2977451qkf.99.2022.05.20.05.40.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:40:32 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2fee010f509so85564457b3.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:40:32 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr9969695ywg.316.1653050431948; Fri, 20
 May 2022 05:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com> <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
In-Reply-To: <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 May 2022 14:40:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-staging@lists.linux.dev,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Günter

On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/18/22 17:55, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> >
> > Error/Warning reports:
> >
> > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> >
> > Error/Warning: (recently discovered and may have been fixed)
> >
> [ .. ]
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
>
> This is getting tiresome. Every driver using outb() on m68k will
> experience that "problem". As far as I can see, it is caused by
>
> #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
>
> in arch/m68k/include/asm/raw_io.h. I have no idea what the
> "(void)" is for,

The "(void)" makes sure there is no return value.
Which matters if the result of a function returning void is propagated
to another function returning void.

> but removing it "fixes" the problem.

This introduces new problems (m68k all{mod,yes}config):

    In file included from arch/m68k/include/asm/io_mm.h:25,
                     from arch/m68k/include/asm/io.h:8,
                     from include/linux/io.h:13,
                     from include/linux/of_address.h:7,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:13:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h: In function ‘gmu_write_rscc’:
    arch/m68k/include/asm/raw_io.h:34:80: error: ‘return’ with a
value, in function returning void [-Werror=return-type]
       34 | #define out_le32(addr,l) ((*(__force volatile __le32 *)
(unsigned long)(addr)) = cpu_to_le32(l))
          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
    arch/m68k/include/asm/io_mm.h:397:26: note: in expansion of macro ‘out_le32’
      397 | #define writel(val,addr) out_le32((addr),(val))
          |                          ^~~~~~~~
    drivers/gpu/drm/msm/msm_drv.h:468:32: note: in expansion of macro ‘writel’
      468 | #define msm_writel(data, addr) writel((data), (addr))
          |                                ^~~~~~
    /drivers/gpu/drm/msm/adreno/a6xx_gmu.h:141:9: note: in expansion
of macro ‘msm_writel’
      141 |  return msm_writel(value, gmu->rscc + (offset << 2));
          |         ^~~~~~~~~~
    In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu.h:11,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:20:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h:139:20: note: declared here
      139 | static inline void gmu_write_rscc(struct a6xx_gmu *gmu,
u32 offset, u32 value)
          |                    ^~~~~~~~~~~~~~

These can be fixed using e.g. (there are more in the Adreno driver):

     static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
     {
    -       return msm_writel(value, gmu->mmio + (offset << 2));
    +       msm_writel(value, gmu->mmio + (offset << 2));
     }

> Either case, this is not a problem with the nct6775 driver,
> nor is it a new problem.

Indeed.

For the sparse people:

The full error is:

        drivers/net/appletalk/cops.c:382:17: error: incompatible types
in conditional expression (different base types):
        drivers/net/appletalk/cops.c:382:17:    unsigned char
        drivers/net/appletalk/cops.c:382:17:    void

Basically, sparse doesn't like "a ? b : c", if the return types of
b and c don't match, even if the resulting value is not used.

E.g. outb() on m68k:

    #define outb(val, port) (((port) < 1024 && ISA_TYPE ==
ISA_TYPE_ENEC) ? isa_rom_outb((val), (port)) : isa_outb((val),
(port)))

where isa_rom_outb() leads to rom_out_8() returning u8, while
isa_outb() leads to the out_8() that includes the cast to void.

So the best solution seems to be to add more "(void)" casts, to e.g.
rom_out_8() and friends?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
