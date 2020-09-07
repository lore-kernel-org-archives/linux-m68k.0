Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A54C433E2
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F388E206B8
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgIGHEb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 03:04:31 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39184 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIGHE3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 03:04:29 -0400
Received: by mail-oi1-f193.google.com with SMTP id 11so4407672oiq.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJwBBZezalgxoav9pFU9p/QT3ujdvMtOb3CU37OeFfo=;
        b=I7tls1x3sAy7vW82tvYHdqRzwQv8DlE61EQj+X3Nk9UXqbVLZsG6KGTVnvmAgAxP0n
         tasP+9yVeiayxodJI0FtJ9BdbgDkx3UOAqIlj7GtevJz4yxeonT9n1wJHonP3pJZu70A
         FUkiz3uJjYJ707PXB8kTDAfQSxB4PpuCvQIqGRQNKWPAwd796QX5vJbw2OI9jxfR7isB
         f/dw9KHNqyFziSZ0hNEXT+mTfuXgIvCODHT+554D9qLPxC/4ZKVfsYNZr+VQJO6x/tzW
         9+JcFqYg3KsihmUDyectKqFjqgsAQPo21vIe492rG3Ru5OzuzrZFySRvepbillYlUBpW
         rb4g==
X-Gm-Message-State: AOAM530S7/3KZQKnJFPfrV9DUlp8KAzERJar1BbepM+6JgiQ/XsigLUi
        Smgf/1538b38mZyZ/rhMEDoO8Ovg0s8vWF+aECw=
X-Google-Smtp-Source: ABdhPJw1Sewyc6zq2Gf5bdKwckeps02eqcgBsg7uUYuAVw+H69R7OI48ypEKSpVvPDgLkws5PdyDTCeZcCzUXafTNCw=
X-Received: by 2002:aca:4441:: with SMTP id r62mr647380oia.153.1599462266567;
 Mon, 07 Sep 2020 00:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <202009060512.tOc1hWe8%lkp@intel.com> <20200907062456.GA19124@lst.de>
In-Reply-To: <20200907062456.GA19124@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 09:04:15 +0200
Message-ID: <CAMuHMdVTysHJoghpLC5KyX=s7SOFNFxsXKX1m69AseM12x3XRQ@mail.gmail.com>
Subject: Re: [char-misc:char-misc-next 28/28] drivers/char/mem.c:737:21:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
To:     Christoph Hellwig <hch@lst.de>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Sep 7, 2020 at 8:25 AM Christoph Hellwig <hch@lst.de> wrote:
> On Sun, Sep 06, 2020 at 05:14:15AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
> > head:   99f667352f6c938440d9043d0f66f859d6f3d50d
> > commit: 99f667352f6c938440d9043d0f66f859d6f3d50d [28/28] /dev/zero: also implement ->read
> > config: m68k-randconfig-s031-20200904 (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
>
> Looks like m68 does not have proper __user annotations for clear_user..

M68k has, m68knommu apparently hasn't.
Same for strncpy_from_user() and strnlen_user().

> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # apt-get install sparse
> >         # sparse version: v0.6.2-191-g10164920-dirty
> >         git checkout 99f667352f6c938440d9043d0f66f859d6f3d50d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=m68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> >
> > sparse warnings: (new ones prefixed by >>)
> >
> >    drivers/char/mem.c:163:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user *buf @@
> >    drivers/char/mem.c:163:37: sparse:     expected void *to
> >    drivers/char/mem.c:163:37: sparse:     got char [noderef] __user *buf
> > >> drivers/char/mem.c:737:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user * @@
> >    drivers/char/mem.c:737:21: sparse:     expected void *to
> > >> drivers/char/mem.c:737:21: sparse:     got char [noderef] __user *

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
